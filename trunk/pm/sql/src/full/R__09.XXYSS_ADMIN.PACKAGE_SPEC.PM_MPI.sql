CREATE OR REPLACE PACKAGE "XXYSS_ADMIN"."PM_MPI" IS

  pragma restrict_references( pm_mpi, rnps, wnps, rnds, wnds );

  /* these items can be calculated */
  c_buffer_hit_ratio               constant integer := 1;
  c_dictionary_hit_ratio           constant integer := 2;
  c_library_cache_hit_ratio        constant integer := 3;
  c_sorts_in_memory                constant integer := 4;
  c_percent_data_buffers_free      constant integer := 5;
  c_shared_pool_contiguous         constant integer := 6;
  c_top10_memory_abuse             constant integer := 7;

  /* these items can not be calculated */
  c_top25_memory_tuned             constant integer := 8;
  c_pl_sql_pinned                  constant integer := 9;

  c_min_item                       constant integer := c_buffer_hit_ratio;
  c_max_item                       constant integer := c_pl_sql_pinned;

  function get_value( i_item in integer )
  return number;

  pragma restrict_references( get_value, wnps, wnds );

  function version
  return varchar2;

  pragma restrict_references( version, rnps, wnps, rnds, wnds );

END pm_mpi;

-- =cut
/

