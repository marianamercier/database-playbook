-- 18. Long-Running Transactions
-- Long xacts can prevent vacuum and cause bloat.
SELECT pid, usename,
       now() - xact_start AS xact_duration,
       query
FROM pg_stat_activity
WHERE xact_start IS NOT NULL
ORDER BY xact_duration DESC;
