use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $VERSION = '$Name$'; # something like v3_0 or pm_3_0
if ( $VERSION =~ m/Name: [^0-9]+(\S+)\s\$/ ) {
  $VERSION = $1;
} else {
  $VERSION = '0_1';
}

WriteMakefile(
  'NAME'	=> 'pm',
  'dist' => { COMPRESS => 'gzip', TO_UNIX => 'perl -S dos2unix.pl $(DISTVNAME)' },
  'depend' => { manifest => FORCE },
  'VERSION' => $VERSION
);
