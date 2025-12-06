-- Phase VI – PL/SQL Procedures & Functions
-- File: 08_plsql_procedures_functions.sql

-- 1. Function: total_missed
CREATE OR REPLACE FUNCTION total_missed (p_status VARCHAR2) RETURN NUMBER IS
  v_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_cnt FROM prescriptions WHERE status = p_status;
  RETURN v_cnt;
EXCEPTION
  WHEN OTHERS THEN RETURN -1;
END;
/

-- 2. Function: is_due_soon
CREATE OR REPLACE FUNCTION is_due_soon (p_dose_time VARCHAR2) RETURN BOOLEAN IS
BEGIN
  -- simplified: true if current time within 30 min of dose_time
  RETURN ABS(TO_NUMBER(TO_CHAR(SYSDATE,'HH24MI')) - TO_NUMBER(REPLACE(p_dose_time,':'))) <= 30;
END;
/

-- 3. Procedure: add_prescription
CREATE OR REPLACE PROCEDURE add_prescription (
  p_prescription_id NUMBER,
  p_patient_id NUMBER,
  p_medicine_name VARCHAR2,
  p_dose_time VARCHAR2
) IS
BEGIN
  INSERT INTO prescriptions (prescription_id, patient_id, medicine_name, dose_time, status, prescribed_date)
  VALUES (p_prescription_id, p_patient_id, p_medicine_name, p_dose_time, 'Pending', SYSDATE);
  COMMIT;
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20001, 'Prescription ID already exists');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, SQLERRM);
END;
/

-- 4. Procedure: cursor example
CREATE OR REPLACE PROCEDURE remind_missed IS
  CURSOR c_miss IS
    SELECT p.full_name, pr.medicine_name, pr.dose_time
    FROM   prescriptions pr
    JOIN   patients p ON p.patient_id = pr.patient_id
    WHERE  pr.status = 'Missed';
BEGIN
  FOR rec IN c_miss LOOP
    DBMS_OUTPUT.PUT_LINE('REMINDER: '||rec.full_name||' missed '||rec.medicine_name||' at '||rec.dose_time);
  END LOOP;
END;
/

-- 5. Window function example
CREATE OR REPLACE VIEW v_patient_rank AS
SELECT patient_id,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS adherence_rank,
       COUNT(*) AS total_prescriptions
FROM   prescriptions
WHERE  status = 'Taken'
GROUP  BY patient_id;
/

-- quick tests
SET SERVEROUTPUT ON
EXEC DBMS_OUTPUT.PUT_LINE('Total missed: '||total_missed('Missed'));
EXEC remind_missed;