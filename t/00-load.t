#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Test::Automake' ) || print "Bail out!\n";
}

diag( "Testing Test::Automake $Test::Automake::VERSION, Perl $], $^X" );
