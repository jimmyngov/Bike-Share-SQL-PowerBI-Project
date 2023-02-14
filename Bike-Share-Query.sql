with rideyear as (
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202106-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, CONVERT(nvarchar(255), start_station_id) AS start_station_id, end_station_name, CONVERT(nvarchar(255), end_station_id) AS end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202107-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202108-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202109-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202110-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, CONVERT(nvarchar(255), start_station_id) AS start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202111-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202112-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202201-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202202-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202203-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, CONVERT(nvarchar(255), start_station_id) AS start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202204-divvy-tripdata$']
UNION ALL
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.['202205-divvy-tripdata$'])

SELECT 
ride_id, rideable_type, started_at, ended_at, 
CAST(DATEDIFF(MINUTE, started_at, ended_at)/60.0 AS DECIMAL(35,2)) AS ridelength_decimalhours,
DATENAME(WEEKDAY, started_at) AS day_of_week,
DATEPART(WEEKDAY, started_at) AS Day_NumberSort,
DATEPART(HOUR, started_at) AS hour_started,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual
FROM rideyear