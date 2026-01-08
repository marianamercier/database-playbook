-- 02. Blocking Sessions
SELECT
    r.session_id AS blocked_session_id,
    r.blocking_session_id,
    DB_NAME(r.database_id) AS database_name,
    r.wait_type,
    r.wait_time,
    r.wait_resource
FROM sys.dm_exec_requests r
WHERE r.blocking_session_id <> 0;
