-- Quel quartier (Borough) génère les pourboires les plus élevés en pourcentage ?
WITH profitability AS (
    SELECT 
        pickup_borough,
        pickup_zone,
        AVG(tip_percentage) AS avg_tip_pct,
        COUNT(*) AS total_trips
    FROM {{ ref('fct_taxi_trips') }}
    WHERE pickup_borough IS NOT NULL
    GROUP BY 1, 2
    HAVING total_trips > 10 -- On filtre pour avoir des données significatives
)

SELECT *
FROM profitability
ORDER BY avg_tip_pct DESC
LIMIT 5;