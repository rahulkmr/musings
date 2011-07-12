#!/usr/bin/perl -w

$foo = 2;

sub bar {
	blah();
}

sub blah {
    print $foo, "\n";
}
sub baz {
	local $foo = 10;
	bar();
}

baz();
print $foo, "\n";
