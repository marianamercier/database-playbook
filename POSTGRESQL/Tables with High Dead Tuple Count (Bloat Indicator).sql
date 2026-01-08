SELECT schemaname, relname,
       n_live_tup, n_dead_tup,
       last_autovacuum, last_vacuum
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC
LIMIT 10;
