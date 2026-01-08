-- 17. Backup Status
SELECT
    d.name AS database_name,
    MAX(b.backup_finish_date) AS last_backup
FROM sys.databases d
LEFT JOIN msdb.dbo.backupset b ON b.database_name = d.name
GROUP BY d.name;
