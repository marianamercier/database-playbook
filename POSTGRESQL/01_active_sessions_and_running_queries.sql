-- 01. Active Sessions and Running Queries
-- Shows non-idle sessions, wait events, and query runtime.
SELECT pid, usename, application_name, client_addr,
       state, wait_event_type, wait_event,
       now() - query_start AS runtime,
       query
FROM pg_stat_activity
WHERE state <> 'idle'
ORDER BY runtime DESC;
