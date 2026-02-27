SELECT 
    time_of_day_category,
    AVG(tip_percentage) AS avg_tip_pct,
    COUNT(*) AS nb_trajets
FROM {{ ref('fct_taxi_trips') }}
GROUP BY 1
ORDER BY avg_tip_pct DESC;