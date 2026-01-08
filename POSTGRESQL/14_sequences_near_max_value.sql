-- 14. Sequences Near Maximum Value
-- Works on PostgreSQL versions where information_schema.sequences exposes last_value/max_value.
SELECT sequence_schema, sequence_name,
       last_value, max_value
FROM information_schema.sequences
WHERE last_value > max_value * 0.8;
