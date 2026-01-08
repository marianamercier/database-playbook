-- 10. TempDB Usage per Session
SELECT TOP (25)
    s.session_id,
    s.login_name,
    (u.user_objects_alloc_page_count + u.internal_objects_alloc_page_count) * 8 / 1024.0 AS tempdb_mb
FROM sys.dm_db_session_space_usage u
JOIN sys.dm_exec_sessions s ON s.session_id = u.session_id
ORDER BY tempdb_mb DESC;
