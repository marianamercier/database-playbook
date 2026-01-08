SELECT relname,
       last_autovacuum,
       autovacuum_count,
       vacuum_count
FROM pg_stat_user_tables
ORDER BY last_autovacuum NULLS FIRST;
