SELECT datname,
       age(datfrozenxid)
FROM pg_database
ORDER BY age(datfrozenxid) DESC;
