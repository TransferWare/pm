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
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:	Calculate Memory Performance Index.
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.4  2002/05/24 14:22:44  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.3  2002/02/01 10:59:56  gpaulissen
REMARK  New make environment
REMARK
REMARK  Revision 1.2  2002/01/17 10:57:04  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.1  2000/03/07 16:26:40  gpaulissen
REMARK  TPI toegevoegd
REMARK
REMARK  Revision 1.1  2000/03/07 15:56:05  gpaulissen
REMARK  TPI added
REMARK
REMARK

PROMPT Creating Package Specification pm_mpi

SET DOCUMENT OFF

DOCUMENT

The following documentation uses the Perl pod format. A html file
can be constructed by: 

  pod2html --infile=pm_mpi.pks --outfile=pm_mpi.html

=pod

=head1 NAME

pm_mpi - Calculate Memory Performance Index.

=head1 SYNOPSIS

=cut

#

-- =pod

CREATE OR REPLACE PACKAGE pm_mpi IS

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

DOCUMENT

=head1 DESCRIPTION

=head2 ROUTINES

=over 4

=item get_value

This routine return the value of an item. See C<c_buffer_hit_ratio>,
C<c_dictionary_hit_ratio>, C<c_library_cache_hit_ratio>, C<c_sorts_in_memory>,
C<c_percent_data_buffers_free>, C<c_shared_pool_contiguous> and C<c_top10_memory_abuse>.

=item version

Return versioning info of this package.

=back

=head2 CONSTANTS

=over 4

=item c_buffer_hit_ratio

Calculates the buffer hit ratio as a percentage (0 till 100).

=item c_dictionary_hit_ratio

Calculates the dictionary hit ratio as a percentage (0 till 100).

=item c_library_cache_hit_ratio

Calculates the library cache hit ratio as a percentage (0 till 100).

=item c_sorts_in_memory

Calculates the rate of sorts in memory compared to sort on disk. A percentage
is returned.

=item c_percent_data_buffers_free

Returns the percentage of data buffers still free.

=item c_shared_pool_contiguous

Returns the percentage of contiguous shared pool memory, i.e. the number of
bytes of status 'free' or 'perm' divided by the total number of bytes.

=item c_top10_memory_abuse

The number of buffer gets for the 10 worst SQL statements (in v$sqlarea)
divided by the total amount of buffer gets as a percentage.

=item c_top25_memory_tuned

Are the worst 25 SQL statements concerning disk I/O tuned or not? This item can not be calculated.

=item c_pl_sql_pinned

Are PL/SQL objects pinned when needed or not? This item can not be calculated.

=back

=head1 EXAMPLES

=head1 AUTHOR

Gert-Jan Paulissen, E<lt>gpaulissen@transfer-solutions.comE<gt>.

=head1 BUGS

=head1 NOTES

=head2 Documentation

This documentation is generated using the Perl pod format as follows:

     pod2html --infile=pm_mpi.pks --outfile=pm_mpi.html

=head2 Fixed tables

The fixed tables x$bh and x$ksmsp have to be queried for calculating some percentages. It appears that select
rights on these tables can not be granted to any account (excluding
SYS). Hence this package needs to be owned by SYS and grant execute rights on this package
can be given to other accounts.

=head2 Usage in SQL statements

The function get_value can be used in SQL statements.

=head1 SEE ALSO

=head1 COPYRIGHT

All rights reserved by Transfer Solutions b.v.

=cut

#


