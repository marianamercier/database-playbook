-- 05. Long Transactions
SELECT
    trx_id,
    trx_mysql_thread_id,
    trx_started,
    TIMESTAMPDIFF(SECOND, trx_started, NOW()) AS trx_seconds
FROM information_schema.INNODB_TRX
ORDER BY trx_started;
