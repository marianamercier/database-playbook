-- 02. Long Running Sessions
SELECT pid,
       user_name,
       starttime,
       datediff(seconds, starttime, getdate()) AS runtime_sec,
       query
FROM svv_sessions
WHERE state = 'Running'
ORDER BY runtime_sec DESC;
