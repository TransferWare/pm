ALTER TABLE "PM_SYSSTAT" ADD CONSTRAINT "PM_SYS_CK1" CHECK ( 
      db = upper(db) and
      run_id >= 1
      ) ENABLE;

ALTER TABLE "PM_SYSSTAT" ADD CONSTRAINT "PM_SYS_CK2" CHECK ( 
      value >= 0
      ) ENABLE;

ALTER TABLE "PM_SYSSTAT" ADD CONSTRAINT "PM_SYS_PK" PRIMARY KEY ("DB", "RUN_ID", "NAME") ENABLE;
