-- 09. Cache Hit Ratio per Database
SELECT datname,
       blks_hit * 100.0 / NULLIF(blks_hit + blks_read, 0) AS hit_ratio
FROM pg_stat_database;
