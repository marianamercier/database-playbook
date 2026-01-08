-- 01. Active Sessions
SELECT pid, user_name, db_name, starttime, state, query
FROM svv_sessions
WHERE state = 'Running'
ORDER BY starttime;
