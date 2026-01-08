-- 09. Database Size
SELECT
    DB_NAME(database_id) AS database_name,
    SUM(size) * 8 / 1024.0 AS size_mb
FROM sys.master_files
GROUP BY database_id
ORDER BY size_mb DESC;
