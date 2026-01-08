-- 20. Commit / Rollback History
SELECT xid, starttime, endtime, aborted
FROM stl_commit_stats
ORDER BY starttime DESC
LIMIT 10;
