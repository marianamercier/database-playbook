-- 12. Missing Indexes (review carefully)
SELECT TOP (25)
    mid.statement,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM sys.dm_db_missing_index_details mid;
