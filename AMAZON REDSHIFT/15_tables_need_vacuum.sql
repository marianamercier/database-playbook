-- 15. Tables Needing Vacuum
SELECT schemaname, tablename, unsorted
FROM svv_table_info
WHERE unsorted > 20
ORDER BY unsorted DESC;
