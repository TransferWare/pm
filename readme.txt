
		     Performance Monitor, Version $Name$

			  Copyright: see LICENSE.TXT
			    All rights reserved.


This application monitors the performance of Oracle databases.

NOTES

1) This release includes the Total Performance Index.

2) Third party software: Oracle Forms 6i or higher, Oracle Reports 6i of higher.

INSTALLATION

1) Detailed instructions are in doc/pm-manual.rtf

Upgrade from a prior version:

Use TransVersion (http://www.sourceforge.net/projects/transferware) to upgrade.

BUGS

* 02-01-2002 
  Report pm0041 is now ordered by the number of executions descending: it makes
  more sense to show the most executed statements first.

* 02-01-2002
  pm_cfg.get_memory_io_rate and pm_cfg.get_disk_io_rate will always return a
  default (not NULL).

* 15-07-2003
  Installation reviewed and enhanced:
  - Link account should install without errors now. 
  - Forms/Reports must be compiled at installation time.
  - Table RELEASE_INFO added.

* 28-08-2003
  Web enabled.

SUPPORT

Contact Transfer Solutions via e-mail: L<support@transfer-solutions.com>
Supply the version number, the platform, the versions of Oracle tools used and
a description of the problem.

End of the README.
