-- 06. Memory Usage by Clerks
SELECT TOP (20)
    type,
    SUM(pages_kb)/1024.0 AS memory_mb
FROM sys.dm_os_memory_clerks
GROUP BY type
ORDER BY memory_mb DESC;
