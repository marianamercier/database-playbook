-- 11. Plan Cache Memory Usage
SELECT TOP (25)
    cp.size_in_bytes / 1024.0 / 1024.0 AS plan_mb,
    cp.usecounts,
    t.text
FROM sys.dm_exec_cached_plans cp
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) t
ORDER BY cp.size_in_bytes DESC;
