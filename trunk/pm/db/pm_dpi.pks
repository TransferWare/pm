/*
    The Performance Monitor monitors your Oracle databases.
    Copyright (C) 2002  G.J. Paulissen, Transfer Solutions b.v., Leerdam, Netherlands

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:	Calculate Disk Performance Index.
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.4  2002/05/24 14:22:42  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.3  2002/02/01 10:59:56  gpaulissen
REMARK  New make environment
REMARK
REMARK  Revision 1.2  2002/01/17 10:57:03  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.1  2000/03/07 16:26:39  gpaulissen
REMARK  TPI toegevoegd
REMARK
REMARK  Revision 1.1  2000/03/07 15:56:04  gpaulissen
REMARK  TPI added
REMARK
REMARK

PROMPT Creating Package Specification pm_dpi

SET DOCUMENT OFF

DOCUMENT

The following documentation uses the Perl pod format. A html file
can be constructed by: 

  pod2html --infile=pm_dpi.pks --outfile=pm_dpi.html

=pod

=head1 NAME

pm_dpi - Calculate Disk Performance Index.

=head1 SYNOPSIS

=cut

#

-- =pod

CREATE OR REPLACE PACKAGE pm_dpi IS

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

DOCUMENT

=head1 DESCRIPTION

=head2 ROUTINES

=over 4

=item get_value

This routine returns the value of an item. See also C<c_top25_disk_tuned>,
C<c_top10_disk_abuse>, C<c_tables_indexes_separated>,
C<c_chaining_critical_tables>, C<c_oracle_files_separated>,
C<c_rollback_segment_balance>, C<c_temporary_segment_balance>,
C<c_minor_table_fragmentation>, C<c_major_table_fragmentation>.

=item version

Return versioning info of this package.

=back

=head2 CONSTANTS

=over 4

=item c_top25_disk_tuned

=item c_top10_disk_abuse

=item c_tables_indexes_separated

=item c_chaining_critical_tables

=item c_oracle_files_separated

=item c_rollback_segment_balance

=item c_temporary_segment_balance

=item c_minor_table_fragmentation

=item c_major_table_fragmentation

=back

=head1 EXAMPLES

=head1 AUTHOR

Gert-Jan Paulissen, E<lt>gpaulissen@transfer-solutions.comE<gt>.

=head1 BUGS

=head1 NOTES

=head2 Documentation

This documentation is generated using the Perl pod format as follows:

     pod2html --infile=pm_dpi.pks --outfile=pm_dpi.html

=head2 Usage in SQL statements

The functions get_value and version can be used in SQL statements.

=head1 SEE ALSO

=head1 COPYRIGHT

All rights reserved by Transfer Solutions b.v.

=cut

#


