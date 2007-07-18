Performance Monitor

Version: see VERSION
Copyright: see LICENSE.TXT

All rights reserved.


This application monitors the performance of Oracle databases.

RELEASES

6.6.0)

* Oracle 7 and 8 desupported.
* Installation just needs SELECT_CATALOG_ROLE to access V$ views. 
  Direct grants to V$ views are not needed anymore.
* PM$ views removed because now just the V$ tables are used for all Oracle versions.

6.5.0)

* This release includes the Total Performance Index.

NOTES

1) Third party software: Oracle Forms 6i or higher, Oracle Reports 6i of higher.

INSTALLATION

1) See doc/pm-manual.rtf

Upgrade from a prior version:

Use TransVersion (http://www.sourceforge.net/projects/transferware) to upgrade.

BUGS

* 15-12-2004
  Sourceforge issue [ 828145 ] Unit test of trc fails  

* 01-09-2003
  Bugs solved due to Web enabling.

* 28-08-2003
  Web enabled.

* 15-07-2003
  Installation reviewed and enhanced:
  - Link account should install without errors now. 
  - Forms/Reports must be compiled at installation time.
  - Table RELEASE_INFO added.

* 02-01-2002 
  Report pm0041 is now ordered by the number of executions descending: it makes
  more sense to show the most executed statements first.

* 02-01-2002
  pm_cfg.get_memory_io_rate and pm_cfg.get_disk_io_rate will always return a
  default (not NULL).

SUPPORT

Contact Transfer Solutions via e-mail: L<support@transfer-solutions.com>
Supply the version number, the platform, the versions of Oracle tools used and
a description of the problem.

End of the README.
