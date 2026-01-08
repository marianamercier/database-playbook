-- 05. Queries that Scanned the Most Rows
SELECT query,
       SUM(rows) AS total_rows
FROM stl_scan
GROUP BY query
ORDER BY total_rows DESC
LIMIT 10;
