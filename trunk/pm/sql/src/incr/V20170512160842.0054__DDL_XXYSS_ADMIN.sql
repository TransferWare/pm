/* SQL statement 54 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_RUN_CK1;XXYSS_ADMIN;TABLE;PM_RUN;;;;;2) */
ALTER TABLE "XXYSS_ADMIN"."PM_RUN" ADD CONSTRAINT "PM_RUN_CK1" CHECK (
      db = upper(db) and
      run_id >= 1 and
      db_startup_time <= timestamp
      ) ENABLE;

