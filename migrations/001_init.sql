CREATE TABLE personnel (
  person_id NUMBER PRIMARY KEY,
  name      VARCHAR2(100),
  rank      VARCHAR2(50),
  unit      VARCHAR2(100)
);

CREATE TABLE job_assignments (
  job_id        NUMBER PRIMARY KEY,
  emp_id        NUMBER,
  job_title     VARCHAR2(100),
  assigned_on   DATE,
  reviewed_by   VARCHAR2(100)
);
