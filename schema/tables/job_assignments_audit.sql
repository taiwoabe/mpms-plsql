CREATE TABLE job_assignments_audit (
  audit_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  action_type  VARCHAR2(10),
  job_id       NUMBER,
  old_title    VARCHAR2(100),
  new_title    VARCHAR2(100),
  changed_by   VARCHAR2(100),
  changed_on   TIMESTAMP
);
