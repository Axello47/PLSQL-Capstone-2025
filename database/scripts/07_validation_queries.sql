SELECT 'patients' AS tbl, COUNT(*) AS rows FROM patients
UNION ALL
SELECT 'prescriptions', COUNT(*) FROM prescriptions;

SELECT p.patient_id, p.full_name, COUNT(*) AS total_scripts,
       SUM(CASE WHEN pr.status = 'Taken' THEN 1 ELSE 0 END) AS taken,
       ROUND(100 * SUM(CASE WHEN pr.status = 'Taken' THEN 1 ELSE 0 END) / COUNT(*),2) AS adherence_pct
FROM   patients p
JOIN   prescriptions pr ON pr.patient_id = p.patient_id
GROUP  BY p.patient_id, p.full_name
FETCH FIRST 10 ROWS ONLY;

SELECT medicine_name, COUNT(*) AS times_prescribed
FROM   prescriptions
GROUP  BY medicine_name
ORDER  BY times_prescribed DESC;