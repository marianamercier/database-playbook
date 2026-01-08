-- 18. Replication Lag
SELECT CHANNEL_NAME, SERVICE_STATE,
       RECEIVED_TRANSACTION_SET,
       LAST_APPLIED_TRANSACTION
FROM performance_schema.replication_applier_status;
