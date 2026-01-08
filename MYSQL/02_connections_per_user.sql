-- 02. Connections per User
SELECT USER, COUNT(*) AS connections
FROM information_schema.PROCESSLIST
GROUP BY USER
ORDER BY connections DESC;
