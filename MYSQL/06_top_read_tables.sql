-- 06. Tables with Most Reads
SELECT OBJECT_SCHEMA, OBJECT_NAME, COUNT_READ
FROM performance_schema.table_io_waits_summary_by_table
ORDER BY COUNT_READ DESC
LIMIT 10;
