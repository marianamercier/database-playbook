-- 11. Table Sizes
SELECT schemaname, tablename, size
FROM svv_table_info
ORDER BY size DESC
LIMIT 10;
