-- 03. Blocking and Blocked Sessions (Locks)
-- Finds blocked sessions and their blockers.
SELECT blocked.pid AS blocked_pid,
       blocking.pid AS blocking_pid,
       blocked.query AS blocked_query,
       blocking.query AS blocking_query
FROM pg_locks blocked
JOIN pg_locks blocking
  ON blocked.locktype = blocking.locktype
 AND blocked.database IS NOT DISTINCT FROM blocking.database
 AND blocked.relation IS NOT DISTINCT FROM blocking.relation
 AND blocked.page IS NOT DISTINCT FROM blocking.page
 AND blocked.tuple IS NOT DISTINCT FROM blocking.tuple
 AND blocked.transactionid IS NOT DISTINCT FROM blocking.transactionid
 AND blocked.pid <> blocking.pid
JOIN pg_stat_activity blocked ON blocked.pid = blocked.pid
JOIN pg_stat_activity blocking ON blocking.pid = blocking.pid
WHERE NOT blocked.granted;
