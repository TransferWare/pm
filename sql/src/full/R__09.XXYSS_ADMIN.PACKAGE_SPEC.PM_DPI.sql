CREATE OR REPLACE PACKAGE "XXYSS_ADMIN"."PM_DPI" IS

  pragma restrict_references( pm_dpi, rnps, wnps, rnds, wnds );

  /* these items can be calculated */
  c_top10_disk_abuse               constant integer := 102;
  c_rollback_segment_balance       constant integer := 106;
  c_temporary_segment_balance      constant integer := 107;
  c_minor_table_fragmentation      constant integer := 108;
  c_major_table_fragmentation      constant integer := 109;

  /* these items can not be calculated */
  c_top25_disk_tuned               constant integer := 101;
  c_tables_indexes_separated       constant integer := 103;
  c_chaining_critical_tables       constant integer := 104;
  c_oracle_files_separated         constant integer := 105;

  c_min_item                       constant integer := c_top25_disk_tuned;
  c_max_item                       constant integer := c_major_table_fragmentation;

  function get_value( i_item in integer )
  return number;

  pragma restrict_references( get_value, wnps, wnds );

  function version
  return varchar2;

  pragma restrict_references( version, rnps, wnps, rnds, wnds );

END pm_dpi;

-- =cut
/

