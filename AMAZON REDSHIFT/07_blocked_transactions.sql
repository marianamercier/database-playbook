-- 07. Blocked Transactions
SELECT pid, user_name, query, starttime
FROM svv_transactions
WHERE lock_mode IS NOT NULL;
