use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $VERSION = '$Name$'; # something like v3_0 or pm_3_0
if ( $VERSION =~ m/Name: [^0-9]+(\S+)\s\$/ ) {
  $VERSION = $1;
} else {
  $VERSION = '0_1';
}

# Change underscores into dots

$VERSION =~ s/_/./go;

my $TO_UNIX = ( $^O eq 'MSWin32' ? 'perl -S dos2unix.pl $(DISTVNAME)' : '' );

WriteMakefile(
  'NAME'	=> 'pm',
  'dist' => { COMPRESS => 'gzip', TO_UNIX => $TO_UNIX },
  'depend' => { manifest => FORCE },
  'VERSION' => $VERSION
);
