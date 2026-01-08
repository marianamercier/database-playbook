-- 08. Invalid Indexes
SELECT indexrelid::regclass AS index_name,
       indisvalid
FROM pg_index
WHERE NOT indisvalid;
