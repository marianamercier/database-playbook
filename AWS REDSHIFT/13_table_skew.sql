-- 13. Table Skew
SELECT schemaname, tablename, skew_rows
FROM svv_table_info
ORDER BY skew_rows DESC
LIMIT 10;
