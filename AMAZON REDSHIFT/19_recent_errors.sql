-- 19. Recent Query Errors
SELECT userid, query, recordtime, errcode, errmsg
FROM stl_error
ORDER BY recordtime DESC
LIMIT 10;
