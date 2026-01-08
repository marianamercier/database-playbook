-- 12. Tables without Sort Key
SELECT schemaname, tablename
FROM svv_table_info
WHERE sortkey1 IS NULL;
