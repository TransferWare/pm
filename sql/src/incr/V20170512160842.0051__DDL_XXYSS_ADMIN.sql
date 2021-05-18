/* SQL statement 51 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_CK2;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_CK2" CHECK (
      executions >= 0 and
      buffer_gets >= 0 and
      disk_reads >= 0 and
      parse_calls >= 0 and
      sorts >= 0 and
      kept_versions >= 0 and
      loads >= 0 and
      rows_processed >= 0 and
      invalidations >= 0 and
      direct_writes >= 0 and
      application_wait_time >= 0 and
      concurrency_wait_time >= 0 and
      cluster_wait_time >= 0 and
      user_io_wait_time >= 0 and
      plsql_exec_time >= 0 and
      java_exec_time >= 0 and
      cpu_time >= 0 and
      elapsed_time >= 0
      ) ENABLE;

