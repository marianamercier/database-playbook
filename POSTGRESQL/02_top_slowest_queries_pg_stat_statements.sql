-- 02. Top Slowest Queries (pg_stat_statements)
-- Requires: CREATE EXTENSION pg_stat_statements;
SELECT query,
       calls,
       total_exec_time,
       mean_exec_time,
       rows
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;
