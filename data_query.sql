CREATE OR REPLACE TABLE `data-with-bryan.uber_data.analytics_table` AS (
SELECT 
ft.trip_distance_id,
ft.VendorID,
ft.total_amount,
ft.extra,
dt.tpep_pickup_datetime,
dt.tpep_dropoff_datetime,
pc.passenger_count,
td.trip_distance,
rc.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
ft.fare_amount,
ft.mta_tax,
ft.tip_amount,
ft.tolls_amount,
ft.improvement_surcharge,
FROM `data-with-bryan.uber_data.fact_table` ft
JOIN `data-with-bryan.uber_data.datetime_dim` dt ON ft.datetime_id = dt.datetime_id
JOIN `data-with-bryan.uber_data.passenger_count_dim` pc ON pc.passenger_count_id = ft.passenger_count_id
JOIN `data-with-bryan.uber_data.trip_distance_dim` td ON td.trip_distance_id = ft.trip_distance_id 
JOIN `data-with-bryan.uber_data.rate_code_dim` rc ON rc.rate_code_id = ft.rate_code_id 
JOIN `data-with-bryan.uber_data.pickup_location_dim` pick ON pick.pickup_location_id = ft.pickup_location_id 
JOIN `data-with-bryan.uber_data.dropoff_location_dim` drop ON drop.dropoff_location_id = ft.dropoff_location_id 
JOIN `data-with-bryan.uber_data.payment_type_dim` pay ON pay.payment_type_id = ft.payment_type_id
);

