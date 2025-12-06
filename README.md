# Smart Medication Reminder System  
**Oracle PL/SQL Capstone 2025-26**  
Student: **SHEMA AXEL** (ID: 29273)  
Institution: Adventist University of Central Africa (AUCA)  
Lecturer: Eric Maniraguha  
Presentation: [mon_29273_axel_medicationms_db.pptx](./mon_29273_axel_medicationms_db.pptx)

## 1. Problem in a sentence
50 % of patients forget doses → poor adherence → hospital re-admissions; we give providers a real-time Oracle dashboard to track and improve adherence.

## 2. Quick Start (run in SQL*Plus or SQL Developer)
```bash
git clone https://github.com/YOUR_USERNAME/PLSQL-Capstone-2025.git
cd PLSQL-Capstone-2025/database/scripts
sqlplus mon_29273_axel_medicationms_db/axel@localhost:1521/XEPDB1
SQL> @01_create_tables.sql
SQL> @02_create_pdb.sql
SQL> @03_create_tablespaces.sql
SQL> @04_create_user.sql
SQL> @05_test_connection.sql
SQL> @06_insert_data.sql
SQL> @07_validation_queries.sql
SQL> @08_plsql_procedures_functions.sql
SQL> @09_trigger_audit.sql
3. Repo Map
Copy
PLSQL-Capstone-2025/
├── README.md                                    ← this file
├── mon_29273_axel_medicationms_db.pptx         ← 10-slide deck
├── screenshots/                                 ← all PNG proofs
├── database/scripts/                            ← 09 numbered SQL files
├── business_intelligence/                       ← dashboard mock-up
└── documentation/                               ← data_dictionary.md, assumptions.md
4. Built With
Oracle 21c XEPDB1
PL/SQL (procedures, functions, packages, triggers, window functions)
BPMN & ER modelling (draw.io)
3NF schema, 100 % constraint coverage, full audit trail
5. Key Metrics (test data)
Table
Copy
Table	Rows	Notes
PATIENTS	100	18-82 yrs, unique contact
PRESCRIPTIONS	300	3 per patient, realistic status mix
Adherence	82 %	calculated via window function
6. Business-Rule Note (rubric adaptation)
The original spec required “employees cannot change data on weekdays”; we replaced that with a medically valid rule → “cannot mark dose Taken > 2 h past scheduled time” to suit a 24×7 hospital environment. The mechanics (compound trigger + audit log) remain identical and satisfy Phase-VII requirements.
7. License & Originality
This code is individual work by SHEMA AXEL, 2025.
No external libraries; Oracle sample schemas not used.