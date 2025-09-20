WITH aggregat AS (
    SELECT 
        MIN(lat_n)  AS min_lat,
        MAX(lat_n)  AS max_lat,
        MIN(long_w) AS min_long,
        MAX(long_w) AS max_long
    FROM station
)
SELECT 
    CAST(
        (ABS(max_lat - min_lat) + ABS(max_long - min_long)) 
        AS DECIMAL(10,4)
    ) AS jarak_manhattan
FROM aggregat;
