-- 20. Always On Availability Group Health
SELECT
    ag.name,
    ar.replica_server_name,
    rs.role_desc,
    drs.synchronization_health_desc
FROM sys.availability_groups ag
JOIN sys.availability_replicas ar ON ag.group_id = ar.group_id
JOIN sys.dm_hadr_availability_replica_states rs ON ar.replica_id = rs.replica_id
JOIN sys.dm_hadr_database_replica_states drs ON rs.replica_id = drs.replica_id;
