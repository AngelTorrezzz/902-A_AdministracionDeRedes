#!/usr/bin/perl

open(my $in, "<", "input.txt") or die "Can't open input.txt: $!";

open(my $out, ">", "output.txt") or die "Can't open output.txt: $!";

open(my $log, ">>", "my.log") or die "Can't open my.log: $!";

while(<$in>) { #assigns each line in turn to $_
	print "Just read in this line: $_";
}
