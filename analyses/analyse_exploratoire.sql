-- SELECT * FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet' LIMIT 10;

-- SELECT VendorID, COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- GROUP BY VendorID;

-- SELECT store_and_fwd_flag, COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- GROUP BY store_and_fwd_flag ;

-- SELECT payment_type, COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- GROUP BY payment_type;

-- SELECT PULocationID, COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- GROUP BY PULocationID;

-- SELECT DOLocationID, COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- GROUP BY DOLocationID;

-- SELECT COUNT(*) AS trips_count
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- WHERE tpep_pickup_datetime > tpep_dropoff_datetime;

-- SELECT*
-- FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
-- WHERE tpep_pickup_datetime > tpep_dropoff_datetime
-- LIMIT 10;

-- .read 'C:\Users\Dell\Desktop\dbt_project\project_dbt\analyses\analyse_exploratoire.sql'

SELECT COUNT(*) AS trips_count
FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
WHERE trip_distance <=0;

SELECT*
FROM 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet'
WHERE trip_distance =0
LIMIT 10;