--- Weather Analysis
SELECT ROUND(AVG(t1.lat_n), 4) AS median
FROM (
        /*get a sorted two-column table with one of the columns an index for the sorted rows*/
        SELECT @row_id := @row_id + 1 AS row_id, s.lat_n
        FROM station AS s 
        CROSS JOIN (SELECT @row_id := 0) AS r
        ORDER BY s.lat_n) AS t1
CROSS JOIN (
        /*get a single value for total rows*/
        SELECT COUNT(*) AS total_rows
        FROM station) AS t2
/*find the middle value for an odd number set or average of two middle value for an even set*/
WHERE t1.row_id in (FLOOR((total_rows + 1) / 2), FLOOR ((total_rows + 2) / 2));