ALTER TABLE "PM_OWNER"."PM_SQL" ADD CONSTRAINT "PM_SQL_CK1" CHECK (
      db = upper(db)
      ) ENABLE;

ALTER TABLE "PM_OWNER"."PM_SQL" ADD CONSTRAINT "PM_SQL_PK" PRIMARY KEY ("DB", "HASH_VALUE", "ADDRESS") ENABLE;

