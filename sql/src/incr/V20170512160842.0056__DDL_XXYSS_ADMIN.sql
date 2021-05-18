/* SQL statement 56 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SES_CK2;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" ADD CONSTRAINT "PM_SES_CK2" CHECK (
      ( sql_hash_value is null and sql_address is null ) or
      ( sql_hash_value is not null and sql_address is not null )
      ) ENABLE;

