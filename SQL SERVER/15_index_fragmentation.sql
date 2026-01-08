-- 15. Index Fragmentation
SELECT
    OBJECT_NAME(ips.object_id) AS table_name,
    i.name AS index_name,
    ips.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'SAMPLED') ips
JOIN sys.indexes i
  ON ips.object_id = i.object_id AND ips.index_id = i.index_id
WHERE ips.page_count > 1000;
