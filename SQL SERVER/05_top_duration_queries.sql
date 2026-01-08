-- 05. Top Queries by Duration (Query Store required)
SELECT TOP (25)
    qsqt.query_sql_text,
    SUM(rs.avg_duration * rs.count_executions) AS total_duration
FROM sys.query_store_query_text qsqt
JOIN sys.query_store_query q ON q.query_text_id = qsqt.query_text_id
JOIN sys.query_store_plan p ON p.query_id = q.query_id
JOIN sys.query_store_runtime_stats rs ON rs.plan_id = p.plan_id
GROUP BY qsqt.query_sql_text
ORDER BY total_duration DESC;
