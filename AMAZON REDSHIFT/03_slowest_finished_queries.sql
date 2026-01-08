-- 03. Slowest Finished Queries
SELECT query,
       userid,
       starttime,
       endtime,
       datediff(seconds, starttime, endtime) AS duration_sec,
       text
FROM stl_query
WHERE endtime IS NOT NULL
ORDER BY duration_sec DESC
LIMIT 10;
