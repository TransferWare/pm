ALTER TABLE "PM_RUN" ADD CONSTRAINT "PM_RUN_CK1" CHECK ( 
      db = upper(db) and
      run_id >= 1 and
      db_startup_time <= timestamp
      ) ENABLE;

ALTER TABLE "PM_RUN" ADD CONSTRAINT "PM_RUN_PK" PRIMARY KEY ("DB", "RUN_ID") ENABLE;

