SELECT *
FROM {{ ref('transform') }}
WHERE (trip_distance / (NULLIF(trip_duration_minutes, 0) / 60)) > 100