-- 18. Connections per User
SELECT usename, COUNT(*) AS connections
FROM svv_sessions
GROUP BY usename
ORDER BY connections DESC;
