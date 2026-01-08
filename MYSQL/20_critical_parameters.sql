-- 20. Critical Configuration Parameters
SHOW VARIABLES WHERE Variable_name IN (
  'innodb_buffer_pool_size',
  'innodb_log_file_size',
  'innodb_flush_log_at_trx_commit',
  'max_connections',
  'tmp_table_size',
  'max_heap_table_size'
);
