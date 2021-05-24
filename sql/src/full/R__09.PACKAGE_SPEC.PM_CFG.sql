CREATE OR REPLACE PACKAGE "XXYSS_ADMIN"."PM_CFG" AUTHID CURRENT_USER IS

  -- pragma for package
  pragma restrict_references( pm_cfg, rnds, wnds, rnps, wnps );

  -- Get statistic #
  function get_statistic#( i_name in varchar2 ) return number;

  pragma restrict_references( get_statistic#, wnds );

  function version return varchar2;

  pragma restrict_references( version, rnds, wnds, rnps, wnps );

end pm_cfg;

-- =cut
/

