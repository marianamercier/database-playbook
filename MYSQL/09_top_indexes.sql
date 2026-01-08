-- 09. Most Used Indexes
SELECT OBJECT_SCHEMA, OBJECT_NAME, INDEX_NAME, COUNT_STAR
FROM performance_schema.table_io_waits_summary_by_index_usage
ORDER BY COUNT_STAR DESC
LIMIT 10;
