/* SQL statement 58 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SEV_CK2;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT" ADD CONSTRAINT "PM_SEV_CK2" CHECK (
      total_waits >= 0 and
      total_timeouts >= 0 and
      time_waited >= 0 and
      average_wait >= 0 and
      time_waited_micro >= 0
      ) ENABLE;

