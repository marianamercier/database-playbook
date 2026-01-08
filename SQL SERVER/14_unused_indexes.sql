-- 14. Unused Indexes (candidates)
SELECT
    OBJECT_NAME(i.object_id) AS table_name,
    i.name AS index_name
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s
  ON s.object_id = i.object_id AND s.index_id = i.index_id
WHERE i.index_id > 1
  AND ISNULL(s.user_seeks,0) = 0
  AND ISNULL(s.user_scans,0) = 0;
