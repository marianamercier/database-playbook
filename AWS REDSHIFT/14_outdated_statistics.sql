-- 14. Outdated Statistics
SELECT schemaname, tablename, stats_off
FROM svv_table_info
WHERE stats_off > 20
ORDER BY stats_off DESC;
