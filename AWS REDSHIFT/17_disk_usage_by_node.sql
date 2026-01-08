-- 17. Disk Usage by Node (RA3)
SELECT node, used, capacity
FROM stv_partitions
ORDER BY used DESC;
