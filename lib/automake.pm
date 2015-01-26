package automake;
our $VERSION = "0.1";
BEGIN {
	if ($ENV{srcdir}) {
		unshift @INC, $ENV{srcdir};
		$ENV{PATH} .= ":$ENV{srcdir}:$ENV{srcdir}/t";
	} else {
		$ENV{PATH} .= ":.:./t";
	}
};
1;

=head1 NAME

automake - Use Perl in your Automake distributions

=head1 SYNOPSIS

    #!/usr/bin/perl
    use automake
    use Test::More;
    use t::common;

    # your tests here

=head1 DESCRIPTION

GNU Automake is a build system commonly used by C projects to build,
test and install software.  Writing the tests in Perl allows the author to
take advantage of the easy and powerful string manipulation capabilities of
the language.

Unfortunately, stock Perl tests don't play nicely with one of Automake's
killer features: VPATH builds.  In a VPATH build, the I<source> directory is
separate from the I<build> directory.  This allows multiple builds to be
done against the same source, either for cross-compiling, debug/stripped
builds, etc.

This module updates B<@INC> so that the calling module can find modules
relative to the source directory, even if it is in a VPATH build directory
on a different filesystem.  It also munges the B<PATH> environment variable
so that utilities from the source directory (i.e. as-is, unmodified Perl
scripts) can be run without having to qualify their paths.

=head1 AUTHOR

Written by James Hunt B<< <james@jameshunt.us> >>.
