#!/usr/bin/perl -w
use strict;

my %data;
$data{'foo'} = <<'EOF';
a string
EOF
$data{'code'} = <<'EOF';
print 'my %data;', "\n";
print '$data{', $_, '} = <<\'EOF\';', "\n$data{$_}EOF\n" for keys %data;
print $data{'code'};
EOF
print 'my %data;', "\n";
print '$data{', $_, '} = <<\'EOF\';', "\n$data{$_}EOF\n" for keys %data;
print $data{'code'};
