CREATE TABLE job_assignments (
  job_id        NUMBER PRIMARY KEY,
  emp_id        NUMBER,
  job_title     VARCHAR2(100),
  assigned_on   DATE,
  reviewed_by   VARCHAR2(100)
);
