-- 18. Long Running Transactions
SELECT
    session_id,
    transaction_begin_time
FROM sys.dm_tran_active_transactions;
