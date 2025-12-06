CONNECT mon_29273_axel_medicationms_db/axel@localhost:1521/ax_pdb_29273

CREATE TABLE patients (
  patient_id      INT PRIMARY KEY,
  full_name       VARCHAR(50) NOT NULL,
  age             INT CHECK (age >= 0),
  contact         VARCHAR(20),
  created_date    DATE DEFAULT SYSDATE
);

CREATE TABLE prescriptions (
  prescription_id   INT PRIMARY KEY,
  patient_id        INT REFERENCES patients(patient_id) ON DELETE CASCADE,
  medicine_name     VARCHAR(50) NOT NULL,
  dose_time         VARCHAR(10),
  status            VARCHAR(20) CHECK (status IN ('Taken','Missed','Pending')),
  prescribed_date   DATE DEFAULT SYSDATE
);