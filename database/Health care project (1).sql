------------------------------------------------------------
-- MEDICATION REMINDER
-- Names: Shema Axel
-- Student ID: 29273
-- Course: PL/SQL Final Practicum Project
------------------------------------------------------------

-- we create tables first
CREATE TABLE patients (
  patient_id NUMBER PRIMARY KEY,
  full_name  VARCHAR2(50),
  age        NUMBER,
  contact    VARCHAR2(20)
);

CREATE TABLE prescriptions (
  prescription_id NUMBER PRIMARY KEY,
  patient_id      NUMBER REFERENCES patients(patient_id),
  medicine_name   VARCHAR2(50),
  dose_time       VARCHAR2(10),
  status          VARCHAR2(20)
);
/

-- I inserted data in the above tables
INSERT INTO patients VALUES (1, 'John Doe', 35, '+250789123456');
INSERT INTO patients VALUES (2, 'Jane Smith', 29, '+250783654789');
INSERT INTO patients VALUES (3, 'Mike Jordan', 42, '+250788222111');

INSERT INTO prescriptions VALUES (101, 1, 'Paracetamol', '08:00', 'Taken');
INSERT INTO prescriptions VALUES (102, 1, 'Ibuprofen', '14:00', 'Missed');
INSERT INTO prescriptions VALUES (103, 2, 'Amoxicillin', '09:00', 'Taken');
INSERT INTO prescriptions VALUES (104, 3, 'Cough Syrup', '20:00', 'Missed');
COMMIT;
/

-- I used fucntions to calculate total missed medications
CREATE OR REPLACE FUNCTION total_missed(p_status VARCHAR2)
RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total  FROM prescriptions WHERE status = p_status;
  RETURN v_total;

EXCEPTION
  WHEN OTHERS THEN
    RETURN -1;
END;
/

-- a procedure to check medicaiona aand also remind patients

CREATE OR REPLACE PROCEDURE check_reminders IS
  
  v_total_missed NUMBER;
  v_counter NUMBER := 0;
  v_patient_name VARCHAR2(50);
  v_medicine_name VARCHAR2(50);
  v_dose_time VARCHAR2(20);
  v_status VARCHAR2(20);

BEGIN
  DBMS_OUTPUT.PUT_LINE('MEDICATION REMINDER SYSTEM');

  -- I used function calling here to specify missed medecation
  v_total_missed := total_missed('Missed');
  DBMS_OUTPUT.PUT_LINE('Total missed medications so far: ' || v_total_missed);

  -- I usde for loop to check times of missed medication
  FOR i IN 1..3 LOOP
    v_counter := v_counter + 1;
    
    --I just made a demo missed patient meds
    v_patient_name := 'Patient_' || i;
    v_medicine_name := 'Medicine_' || i;
-- got an idea online about how we can call calculate the date time minus 1day with HH2:MI meaning hours and minutes
    v_dose_time := TO_CHAR(SYSDATE - i/24, 'HH24:MI');
    
    -- IF condition: checking if they missed so if the count mod is 0 then they missed
    IF MOD(i,2) = 0 THEN
      v_status := 'Missed';
      DBMS_OUTPUT.PUT_LINE('Reminder: ' || v_patient_name || ' missed ' || v_medicine_name || ' at ' || v_dose_time);

-- if it's not they the counter is less than one which means they didn't miss their does
    ELSE
      v_status := 'Taken';
      DBMS_OUTPUT.PUT_LINE(v_patient_name || ' took ' || v_medicine_name || ' on time :' || v_dose_time || );
    END IF;

    -- WHILE LOOP dwith a demo example
    DECLARE
      t NUMBER := 3;
    BEGIN
      WHILE t > 0 LOOP
        DBMS_OUTPUT.PUT_LINE('...checking next in ' || t || ' sec');
        t := t - 1;
      END LOOP;
    END;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('DONE: Checked ' || v_counter || ' reminders ');

  <<done_check>>
  DBMS_OUTPUT.PUT_LINE('CHECK COMPLETE' || CHR(10));

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
-- CHECKING REMINDERS
BEGIN
  check_reminders;
END;
/

UPDATE prescriptions SET status = 'Missed' WHERE prescription_id = 103;
COMMIT;

BEGIN
  check_reminders;
END;
/

