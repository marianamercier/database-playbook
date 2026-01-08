-- 10. WLM Service Class Stats
SELECT service_class,
       num_executed_queries,
       avg_queue_time
FROM svv_wlm_service_class_state;
