-- 07. Buffer Cache Usage per Database
SELECT
    DB_NAME(database_id) AS database_name,
    COUNT(*) * 8 / 1024.0 AS buffer_cache_mb
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767
GROUP BY database_id
ORDER BY buffer_cache_mb DESC;
