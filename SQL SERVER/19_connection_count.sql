-- 19. Connections per Database
SELECT
    DB_NAME(database_id) AS database_name,
    COUNT(*) AS connections
FROM sys.dm_exec_sessions
GROUP BY database_id;
