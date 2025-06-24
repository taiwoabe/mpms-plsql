CREATE OR REPLACE FUNCTION access_control_fn (
  schema_name VARCHAR2,
  table_name  VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
  RETURN 'rank != ''Private''';  -- Just an example condition
END;
/

BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema   => 'MPMS_USER',
    object_name     => 'personnel',
    policy_name     => 'secure_policy',
    function_schema => 'MPMS_USER',
    policy_function => 'access_control_fn',
    statement_types => 'SELECT'
  );
END;
/
