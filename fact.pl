#!/usr/bin/perl
use List::Util qw(reduce);

# This is how I would write it.
sub fact1 {
    my $num = shift;
    my $output = 1;
    $output *= $_ for (2 .. $num);
    return $output;
}

# Most people don't prefer inline loops and $_ variable, though
# I don't see why not.
sub fact2 {
    my $num = shift;
    my $output = 1;
    for my $i (2 .. $num) {
        $output *= $i;
    }
    return $output;
}

sub fact3 {
    my $num = shift;
    return reduce { $a * $b } 2..$num
}

print fact3(10);
