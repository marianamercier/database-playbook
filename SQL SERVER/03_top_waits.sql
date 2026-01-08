-- 03. Top Wait Statistics
SELECT TOP (25)
    wait_type,
    wait_time_ms / 1000.0 AS wait_seconds,
    100.0 * wait_time_ms / SUM(wait_time_ms) OVER () AS percentage
FROM sys.dm_os_wait_stats
WHERE wait_type NOT LIKE 'SLEEP%'
ORDER BY wait_time_ms DESC;
