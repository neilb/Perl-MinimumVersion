#!/usr/bin/perl

use strict;
use warnings;

use Test::More 0.47;

#use version;
use Perl::MinimumVersion;

my %examples = (
    'my @array; pop @array'           => '5.004',
    'my @array; push @array'          => '5.004',
    'my $arrayref; pop $arrayref'     => '5.014',
    'my $arrayref; push $arrayref'    => '5.014',
    'my $arrayref; shift $arrayref'   => '5.014',
    'my $arrayref; splice $arrayref'  => '5.014',
    'my $arrayref; unshift $arrayref' => '5.014',
    'my @array; shift @array'         => '5.004',
    'my @array; splice @array'        => '5.004',
    'my @array; unshift @array'       => '5.004',
    'pop @array'                      => '5.004',
    'pop $arrayref'                   => '5.014',
    'push @array'                     => '5.004',
    'push $arrayref'                  => '5.014',
    'shift @array'                    => '5.004',
    'shift $arrayref'                 => '5.014',
    'splice @array'                   => '5.004',
    'splice $arrayref'                => '5.014',
    'unshift @array'                  => '5.004',
    'unshift $arrayref'               => '5.014',
    'sub unshift { }'                 => '5.004',
    'sub shift { }'                   => '5.004',
    'sub pop { }'                     => '5.004',
    'sub push { }'                    => '5.004',
    'sub splice { }'                  => '5.004',
);

plan tests => scalar( keys %examples );
foreach my $example ( sort keys %examples ) {
    my $p = Perl::MinimumVersion->new( \$example );
    my $v = $p->minimum_version;
    is( $v, $examples{$example}, $example )
      or do { diag "\$\@: $@" if $@ };
}
