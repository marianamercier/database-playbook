-- 06. Active Locks
SELECT pid, lock_owner_pid, relation, mode, granted
FROM stv_locks
WHERE NOT granted;
