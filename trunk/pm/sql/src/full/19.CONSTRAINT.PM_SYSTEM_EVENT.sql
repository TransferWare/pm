ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" ADD CONSTRAINT "PM_SEV_CK1" CHECK (
      db = upper(db) and
      run_id >= 1
      ) ENABLE;

ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" ADD CONSTRAINT "PM_SEV_CK2" CHECK (
      total_waits >= 0 and
      total_timeouts >= 0 and
      time_waited >= 0 and
      average_wait >= 0 and
      time_waited_micro >= 0
      ) ENABLE;

ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" ADD CONSTRAINT "PM_SEV_PK" PRIMARY KEY ("DB", "RUN_ID", "EVENT") ENABLE;

