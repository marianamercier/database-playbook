-- 01. Active Sessions and Running Requests
SELECT TOP (25)
    r.session_id,
    s.login_name,
    s.host_name,
    s.program_name,
    r.status,
    r.cpu_time,
    r.total_elapsed_time,
    r.reads,
    r.writes,
    r.logical_reads,
    DB_NAME(r.database_id) AS database_name,
    r.wait_type,
    r.blocking_session_id,
    t.text AS sql_text
FROM sys.dm_exec_requests r
JOIN sys.dm_exec_sessions s ON s.session_id = r.session_id
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
WHERE r.session_id <> @@SPID
ORDER BY r.cpu_time DESC;
