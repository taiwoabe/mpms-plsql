-- Add the reviewed_by column
ALTER TABLE job_assignments ADD reviewed_by VARCHAR2(100);

-- Update trigger to capture the new column
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
      action_type, assignment_id, new_role, new_status,
      changed_by, changed_on
    ) VALUES (
      v_action, :NEW.assignment_id, :NEW.role_name, :NEW.status,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );
    
  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    INSERT INTO job_assignments_audit (
      action_type, assignment_id, old_role, new_role,
      old_status, new_status,
      changed_by, changed_on
    ) VALUES (
      v_action, :OLD.assignment_id, :OLD.role_name, :NEW.role_name,
      :OLD.status, :NEW.status,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );

  ELSIF DELETING THEN
    v_action := 'DELETE';
    INSERT INTO job_assignments_audit (
      action_type, assignment_id, old_role, old_status,
      changed_by, changed_on
    ) VALUES (
      v_action, :OLD.assignment_id, :OLD.role_name, :OLD.status,
      SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSTIMESTAMP
    );
  END IF;
END;
/
