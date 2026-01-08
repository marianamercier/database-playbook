-- 16. Tables Needing Analyze
SELECT schemaname, tablename, stats_off
FROM svv_table_info
ORDER BY stats_off DESC
LIMIT 10;
