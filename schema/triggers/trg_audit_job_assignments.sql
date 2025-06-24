DROP TRIGGER trg_audit_job_assignments;

CREATE OR REPLACE TRIGGER trg_audit_job_assignments
AFTER INSERT OR UPDATE OR DELETE ON job_assignments
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    INSERT INTO job_assignments_audit (
      action_type, job_id, new_title, changed_by, changed_on
    ) VALUES (
      v_action, :NEW.job_id, :NEW.job_title,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    INSERT INTO job_assignments_audit (
      action_type, job_id, old_title, new_title,
      changed_by, changed_on
    ) VALUES (
      v_action, :OLD.job_id, :OLD.job_title, :NEW.job_title,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );

  ELSIF DELETING THEN
    v_action := 'DELETE';
    INSERT INTO job_assignments_audit (
      action_type, job_id, old_title,
      changed_by, changed_on
    ) VALUES (
      v_action, :OLD.job_id, :OLD.job_title,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );
  END IF;
END;
/
