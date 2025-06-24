CREATE TABLE job_assignments (
  assignment_id NUMBER PRIMARY KEY,
  personnel_id  NUMBER,
  role_name     VARCHAR2(100),
  assigned_date DATE,
  status        VARCHAR2(20)
);
