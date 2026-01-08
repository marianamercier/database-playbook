-- 12. Replication Status (Standby / Replicas)
SELECT client_addr,
       state,
       sync_state,
       replay_lag
FROM pg_stat_replication;
