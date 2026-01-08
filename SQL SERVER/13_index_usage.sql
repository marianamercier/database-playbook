-- 13. Index Usage Stats
SELECT
    OBJECT_NAME(s.object_id) AS table_name,
    i.name AS index_name,
    s.user_seeks,
    s.user_scans,
    s.user_updates
FROM sys.dm_db_index_usage_stats s
JOIN sys.indexes i
  ON s.object_id = i.object_id AND s.index_id = i.index_id
WHERE s.database_id = DB_ID();
