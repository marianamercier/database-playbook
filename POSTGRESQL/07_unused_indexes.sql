-- 07. Unused Indexes
-- Note: idx_scan = 0 can be misleading for new/rarely-used indexes; validate before dropping.
SELECT schemaname, relname, indexrelname,
       idx_scan
FROM pg_stat_user_indexes
WHERE idx_scan = 0
ORDER BY relname;
