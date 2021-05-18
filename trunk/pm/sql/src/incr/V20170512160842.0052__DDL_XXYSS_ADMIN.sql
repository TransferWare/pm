/* SQL statement 52 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_CK3;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_CK3" CHECK (
      /* at least one must be > 0 */
      executions +
      buffer_gets +
      disk_reads +
      parse_calls +
      sorts +
      kept_versions +
      loads +
      rows_processed +
      invalidations +
      direct_writes +
      application_wait_time +
      concurrency_wait_time +
      cluster_wait_time +
      user_io_wait_time +
      plsql_exec_time +
      java_exec_time +
      cpu_time +
      elapsed_time > 0
      ) ENABLE;

