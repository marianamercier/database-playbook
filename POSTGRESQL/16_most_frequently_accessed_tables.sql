-- 16. Most Frequently Accessed Tables
SELECT relname,
       seq_scan + idx_scan AS total_scans
FROM pg_stat_user_tables
ORDER BY total_scans DESC
LIMIT 10;
