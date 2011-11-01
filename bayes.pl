#!/usr/bin/perl -w
use strict;

use Getopt::Long;

my $options = GetOptions (
    "a=f"                 => \(my $a=0),
    "not_a=f"             => \(my $not_a=0),
    "b=f"                 => \(my $b=0),
    "not_b=f"             => \(my $not_b=0),
    "a_given_b=f"         => \(my $a_given_b=0),
    "not_a_given_b=f"     => \(my $not_a_given_b=0),
    "a_given_not_b=f"     => \(my $a_given_not_b=0),
    "not_a_given_not_b=f" => \(my $not_a_given_not_b=0),
    "b_given_a=f"         => \(my $b_given_a=0),
    "not_b_given_a=f"     => \(my $not_b_given_a=0),
    "b_given_not_a=f"     => \(my $b_given_not_a=0),
    "not_b_given_not_a=f" => \(my $not_b_given_not_a=0),
    "h|help"              => \(my $help)
);

my $description =
    "\nThis program solves for all of the options given a few if possible.\n"
    . "--a\n"
    . "--not_a\n"
    . "--b\n"
    . "--a_given_b\n"
    . "--not_a_given_b\n"
    . "--b_given_a\n"
    . "--b_given_not_a\n";


if(1 < $a || 1 < $not_a || 1 < $b || 1 < $a_given_b || 1 < $not_a_given_b ||
   1 < $b_given_a || 1 < $b_given_not_a) {
   print "Error: Input values must be less than zero\n";
   exit 1;
}

if($help) {
    print $description;
    exit 1;

}

my $solve_passes_remaining = 2;

while(0 < $solve_passes_remaining) {
    --$solve_passes_remaining;
    if(0==$a && 0!=$not_a) {
        $a = 1 - $not_a;
        $solve_passes_remaining = 2;
    }
    if(0==$not_a && 0!=$a) {
        $not_a = 1 - $a;
        $solve_passes_remaining = 2;
    }

    if(0==$b && 0!=$not_b) {
        $b = 1 - $not_b;
        $solve_passes_remaining = 2;
    }
    if(0==$not_b && 0!=$b) {
        $not_b = 1 - $b;
        $solve_passes_remaining = 2;
    }

    if(0==$a_given_b && 0!=$not_a_given_b) {
        $a_given_b = 1 - $not_a_given_b;
        $solve_passes_remaining = 2;
    }
    if(0==$not_a_given_b && 0!=$a_given_b) {
        $not_a_given_b = 1 - $a_given_b;
        $solve_passes_remaining = 2;
    }

    if(0==$a_given_not_b && 0!=$not_a_given_not_b) {
        $a_given_not_b = 1 - $not_a_given_not_b;
        $solve_passes_remaining = 2;
    }
    if(0==$not_a_given_not_b && 0!=$a_given_not_b) {
        $not_a_given_not_b = 1 - $a_given_not_b;
        $solve_passes_remaining = 2;
    }

    if(0==$b_given_a && 0!=$not_b_given_a) {
        $b_given_a = 1 - $not_b_given_a;
        $solve_passes_remaining = 2;
    }
    if(0==$not_b_given_a && 0!=$b_given_a) {
        $not_b_given_a = 1 - $b_given_a;
        $solve_passes_remaining = 2;
    }

    if(0==$b_given_not_a && 0!=$not_b_given_not_a) {
        $b_given_not_a = 1 - $not_b_given_not_a;
        $solve_passes_remaining = 2;
    }
    if(0==$not_b_given_not_a && 0!=$b_given_not_a) {
        $not_b_given_not_a = 1 - $b_given_not_a;
        $solve_passes_remaining = 2;
    }

    if(0==$a_given_b && 0!=$b_given_a && 0!=$a && 0!=$b) {
        $a_given_b = ($b_given_a * $a) / $b;
        $solve_passes_remaining = 2;
    }
    if(0==$not_a_given_b && 0!=$b_given_not_a && 0!=$not_a && 0!=$b) {
        $not_a_given_b = ($b_given_not_a * $not_a) / $b;
        $solve_passes_remaining = 2;
    }

    if(0==$b_given_a && 0!=$a_given_b && 0!=$a && 0!=$b) {
        $b_given_a = ($a_given_b * $b) / $a;
        $solve_passes_remaining = 2;
    }
    if(0==$b_given_not_a && 0!=$not_a_given_b && 0!=$not_a && 0!=$b) {
        $b_given_not_a = ($not_a_given_b * $b) / $not_a;
        $solve_passes_remaining = 2;
    }

    if(0==$a_given_not_b && 0!=$not_b_given_a && 0!=$a && 0!=$not_b) {
        $a_given_not_b = ($not_b_given_a * $a) / $not_b;
        $solve_passes_remaining = 2;
    }
    if(0==$not_a_given_not_b && 0!=$not_b_given_not_a && 0!=$not_a && 0!=$not_b) {
        $not_a_given_not_b = ($not_b_given_not_a * $not_a) / $not_b;
        $solve_passes_remaining = 2;
    }

    if(0==$not_b_given_a && 0!=$a_given_not_b && 0!=$a && 0!=$not_b) {
        $not_b_given_a = ($a_given_not_b * $not_b) / $a;
        $solve_passes_remaining = 2;
    }
    if(0==$not_b_given_not_a && 0!=$not_a_given_not_b && 0!=$not_a && 0!=$not_b) {
        $not_b_given_not_a = ($not_a_given_not_b * $not_b) / $not_a;
        $solve_passes_remaining = 2;
    }

    if(0==$b && 0!=$b_given_a && 0!=$a && 0!=$b_given_not_a && 0!=$not_a) {
        $b = ($b_given_a * $a) + ($b_given_not_a * $not_a);
        $solve_passes_remaining = 2;
    }
    #if(0==$not_b && 0!=$not_b_given_a && 0!=$a && 0!=$not_b_given_not_a && 0!=$not_a) {
    #    $b = ($not_b_given_a * $a) + ($not_b_given_not_a * $not_a);
    #    $solve_passes_remaining = 2;
    #}
}

print "\n\n";
print "P(a)              : $a\n";
print "P(-a)             : $not_a\n";
print "P(a) + P(-a)      : " . ($a + $not_a) . "\n\n";

print "P(b)              : $b\n";
print "P(-b)             : $not_b\n";
print "P(b) + P(-b)      : " . ($b + $not_b) . "\n\n";

print "P(a|b)            : $a_given_b\n";
print "P(-a|b)           : $not_a_given_b\n";
print "P(a|b) + P(-a|b)  : " . ($a_given_b + $not_a_given_b) . "\n\n";

print "P(a|-b)           : $a_given_not_b\n";
print "P(-a|-b)          : $not_a_given_not_b\n";
print "P(a|-b) + P(-a|-b): " . ($a_given_not_b + $not_a_given_not_b) . "\n\n";

print "P(b|a)            : $b_given_a\n";
print "P(-b|a)           : $not_b_given_a\n";
print "P(b|a) + P(-b|a)  : " . ($b_given_a + $not_b_given_a) . "\n\n";

print "P(b|-a)           : $b_given_not_a\n";
print "P(-b|-a)          : $not_b_given_not_a\n";
print "P(b|-a) + P(-b|-a): " . ($b_given_not_a + $not_b_given_not_a) . "\n\n";
