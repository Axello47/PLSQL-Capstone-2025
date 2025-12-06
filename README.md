# Smart Medication Reminder System  
**Oracle PL/SQL Capstone 2025-26**  
Student: **SHEMA AXEL** (ID: 29273)  
Institution: Adventist University of Central Africa (AUCA)  
Lecturer: Eric Maniraguha  
Presentation: [mon_29273_axel_medicationms_db.pptx](./mon_29273_axel_medicationms_db.pptx)

---

## 1. Problem in a sentence
50 % of patients forget doses → poor adherence → hospital re-admissions; we give providers a real-time Oracle dashboard to track and improve adherence.

---

## 2. Quick Start (run in SQL*Plus or SQL Developer)
```bash
git clone https://github.com/YOUR_USERNAME/PLSQL-Capstone-2025.git
cd PLSQL-Capstone-2025/database/scripts
sqlplus mon_29273_axel_medicationms_db/axel@localhost:1521/XEPDB1
SQL&gt; @01_create_tables.sql
SQL&gt; @02_create_pdb.sql
SQL&gt; @03_create_tablespaces.sql
SQL&gt; @04_create_user.sql
SQL&gt; @05_test_connection.sql
SQL&gt; @06_insert_data.sql
SQL&gt; @07_validation_queries.sql
SQL&gt; @08_plsql_procedures_functions.sql
SQL&gt; @09_trigger_audit.sql