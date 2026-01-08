-- 07. Tables with Most Writes
SELECT OBJECT_SCHEMA, OBJECT_NAME, COUNT_WRITE
FROM performance_schema.table_io_waits_summary_by_table
ORDER BY COUNT_WRITE DESC
LIMIT 10;
