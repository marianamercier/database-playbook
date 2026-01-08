-- 15. Connections per User
SELECT usename, COUNT(*)
FROM pg_stat_activity
GROUP BY usename
ORDER BY COUNT(*) DESC;
