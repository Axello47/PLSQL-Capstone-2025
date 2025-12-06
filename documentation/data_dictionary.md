| Table          | Column           | Type        | Constraints / Default        | Purpose / Note                          |
|----------------|------------------|-------------|------------------------------|-----------------------------------------|
| patients       | patient_id       | INT         | PRIMARY KEY                  | Unique patient identifier               |
| patients       | full_name        | VARCHAR(50) | NOT NULL                     | Patient legal name                      |
| prescriptions  | patient_id       | INT         | FK → patients ON DELETE CASCADE | Keeps referential integrity, 3NF |