-- 08. WLM Queue State
SELECT service_class,
       num_waiting_queries,
       num_executing_queries
FROM svv_wlm_queue_state;
