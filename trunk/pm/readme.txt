
		     Performance Monitor, Version $Name$

			  Copyright: see LICENSE.TXT
			    All rights reserved.


This application monitors the performance of Oracle databases.

NOTES

1) This release includes the Total Performance Index.

2) The executables for Oracle Forms 5.0 and Oracle Reports 3.0 are no longer
distributed. Forms 5.0 and Reports 3.0 executables can be delivered on demand.

INSTALLATION

1) Detailed instructions are in doc/pm-manual.rtf

Upgrade from a prior version:

1) Only installation from scratch is supported.
   This means that the following items must be dropped:
   a) the (Performance Monitor objects of the) repository owner
   b) all interface accounts
   c) all database links pointing to the interface accounts

2) Install from scratch.

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

SUPPORT

Contact Transfer Solutions via e-mail: L<support@transfer-solutions.com>
Supply the version number, the platform, the versions of Oracle tools used and
a description of the problem.

End of the README.
