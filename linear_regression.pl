#!/usr/bin/perl -w
use strict;
use File::Slurp;

if( 1 != @ARGV || ! -r $ARGV[0] ) {
    print "You must specify a file containing tuples of numbers line\n" .
          "separated with a comma separating the numbers in the tuple.\n";
    exit 1;
}

my $filename = $ARGV[0];
my @tuples = read_file($filename);
#my $contents = do { local( @ARGV, $/ ) = $filename; <> };

my $x_sum  = 0;
my $y_sum  = 0;
my $xy_sum = 0;
my $x2_sum = 0;
my $m      = 0;
my $w0     = 0;
my $w1     = 0;

for my $tuple (@tuples) {
    my @xi_yi = split(/,/, $tuple);
    $x_sum  += $xi_yi[0];
    $y_sum  += $xi_yi[1];
    $xy_sum += ($xi_yi[0] * $xi_yi[1]);
    $x2_sum += ($xi_yi[0]**2);
    ++$m;
}

$w1 = (($m * $xy_sum) - ($x_sum * $y_sum)) / (($m * $x2_sum) - ($x_sum**2));
$w0 = (1/$m)*($y_sum) - ($w1/$m)*($x_sum);

print "x_sum  = $x_sum\n";
print "y_sum  = $y_sum\n";
print "xy_sum = $xy_sum\n";
print "x2_sum = $x2_sum\n";
print "m      = $m\n";
print "---------------\n";
print "w0 = $w0\n";
print "w1 = $w1\n";
print "f(x) = $w1"."x + $w0\n";

