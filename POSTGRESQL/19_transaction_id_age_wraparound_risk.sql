-- 19. Transaction ID Age (Wraparound Risk)
SELECT datname,
       age(datfrozenxid)
FROM pg_database
ORDER BY age(datfrozenxid) DESC;
