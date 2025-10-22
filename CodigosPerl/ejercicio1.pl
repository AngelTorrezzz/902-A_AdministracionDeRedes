#!/usr/bin/perl

use strict;
open(my $in, "<", "texto.txt") or die "No se puede abrir texto.txt:$!";
while(<$in>){
	print "Linea a linea: $_";
}
