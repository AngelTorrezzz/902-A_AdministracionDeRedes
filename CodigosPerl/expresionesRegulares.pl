#!/usr/bin/perl

open(my $in, "<", "texto.txt") or die "Can't open input.txt: $!";
my $cont=1;
my $a="";
open(my $out, ">", "output.txt") or die "Can't open output.txt: $!";
while(<$in>){
	if(/foo/){
		print "texto.txt($cont): $_";
		$a = $_;
		$a =~ s/foo/902-A/g;
		print "output.txt($cont): $a\n";
		print $out $a;
		$cont++;
	}
}
