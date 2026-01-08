-- 09. Query Queue Time
SELECT query,
       service_class,
       total_queue_time / 1000000 AS queue_time_sec
FROM stl_wlm_query
ORDER BY queue_time_sec DESC
LIMIT 10;
