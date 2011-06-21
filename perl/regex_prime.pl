#!/usr/bin/perl -w
use strict;

my $i = 1;
my $num_x = 'x';
my $limit;
while ($i++ < 99) {
  $num_x .= 'x';
  $limit = int(sqrt $i);
  print $i, "\n" if $num_x !~ /^(x x{1,$limit}) \1+$/x;
}
