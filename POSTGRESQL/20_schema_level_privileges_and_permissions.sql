-- 20. Schema-Level Privileges and Permissions
SELECT schema_name, privilege_type, grantee
FROM information_schema.schema_privileges
ORDER BY schema_name;
