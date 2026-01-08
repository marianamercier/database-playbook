-- 04. Queries with Highest CPU Usage
SELECT q.query,
       q.userid,
       SUM(s.cpu_time) AS total_cpu
FROM stl_query q
JOIN stl_wlm_query s ON q.query = s.query
GROUP BY q.query, q.userid
ORDER BY total_cpu DESC
LIMIT 10;
