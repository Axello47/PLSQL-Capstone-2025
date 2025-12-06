CREATE USER mon_29273_axel_medicationms_db
  IDENTIFIED BY axel
  DEFAULT TABLESPACE ax_data_ts
  QUOTA UNLIMITED ON ax_data_ts
  QUOTA UNLIMITED ON ax_idx_ts;

GRANT DBA, CONNECT, RESOURCE TO mon_29273_axel_medicationms_db;