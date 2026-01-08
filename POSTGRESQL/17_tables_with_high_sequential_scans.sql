-- 17. Tables with High Sequential Scans (Potential Missing Indexes)
SELECT relname, seq_scan
FROM pg_stat_user_tables
ORDER BY seq_scan DESC
LIMIT 10;
