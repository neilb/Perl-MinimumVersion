#!/usr/bin/perl

use strict;
use warnings;

use Test::More 0.47;

use Perl::MinimumVersion;

my %examples=(
    q{use re "/xx"; } => '5.025009',
    q{use re "/mxsx"; } => '5.025009',
    q{use re "debug"; } => '5.013010',
    q{use re; } => '5.005',
    q{use re qw(taint /xx); } => '5.025009',
    q{use re qw(taint /x); } => '5.021008',
    q{use re "/x"} => '5.014'
);

plan tests => scalar keys %examples;

foreach my $example (sort keys %examples) {
    my $v = Perl::MinimumVersion->new(\$example)->minimum_version;
    is( $v, $examples{$example}, $example )
        or $@ && diag $@;
}
