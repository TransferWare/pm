ALTER TABLE "PM_SESSION" ADD CONSTRAINT "PM_SES_CK1" CHECK ( 
      db = upper(db) and
      run_id >= 1
      ) ENABLE;

ALTER TABLE "PM_SESSION" ADD CONSTRAINT "PM_SES_CK2" CHECK ( 
      ( sql_hash_value is null and sql_address is null ) or
      ( sql_hash_value is not null and sql_address is not null )
      ) ENABLE;

ALTER TABLE "PM_SESSION" ADD CONSTRAINT "PM_SES_PK" PRIMARY KEY ("DB", "RUN_ID", "SID") ENABLE;

