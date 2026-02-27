{{ config(materialized='view') }}

WITH trips AS (
    SELECT * FROM {{ ref('transform') }}
),

zones AS (
    SELECT * FROM {{ ref('taxi_zone_lookup') }}
)

SELECT 
    t.*,
    -- Joindre pour le lieu de prise en charge
    pickup_z.Borough AS pickup_borough,
    pickup_z.Zone AS pickup_zone,
    -- Joindre pour le lieu de dépose
    dropoff_z.Borough AS dropoff_borough,
    dropoff_z.Zone AS dropoff_zone,
    -- Enrichissement temporel
    EXTRACT(HOUR FROM t.tpep_pickup_datetime) AS pickup_hour,
    dayname(t.tpep_pickup_datetime) AS pickup_day_of_week,
    CASE 
        WHEN EXTRACT(HOUR FROM t.tpep_pickup_datetime) BETWEEN 6 AND 9 THEN 'Matin (Pointe)'
        WHEN EXTRACT(HOUR FROM t.tpep_pickup_datetime) BETWEEN 10 AND 15 THEN 'Journée'
        WHEN EXTRACT(HOUR FROM t.tpep_pickup_datetime) BETWEEN 16 AND 19 THEN 'Soir (Pointe)'
        ELSE 'Nuit'
    END AS time_of_day_category,
    -- Calcul de la vitesse moyenne (vitesse = distance / temps en heures)
    (t.trip_distance / NULLIF(t.trip_duration_minutes / 60.0, 0)) AS average_speed_mph
FROM trips t
LEFT JOIN zones pickup_z ON t.PULocationID = pickup_z.LocationID
LEFT JOIN zones dropoff_z ON t.DOLocationID = dropoff_z.LocationID