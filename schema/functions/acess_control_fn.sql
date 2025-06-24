CREATE OR REPLACE FUNCTION access_control_fn (
  schema_name VARCHAR2,
  table_name  VARCHAR2
)
RETURN VARCHAR2
AUTHID CURRENT_USER
IS
  v_user VARCHAR2(30);
BEGIN
  -- Get the user who is currently connected
  v_user := UPPER(SYS_CONTEXT('USERENV', 'SESSION_USER'));

  -- Access rules based on the logged-in user
  IF v_user = 'COMMANDER' THEN
    RETURN '1=1';  -- See everything
  ELSIF v_user = 'SERGEANT' THEN
    RETURN 'rank = ''Private''';  -- Only see Privates
  ELSE
    RETURN '1=0';  -- Deny all
  END IF;
END;
/
