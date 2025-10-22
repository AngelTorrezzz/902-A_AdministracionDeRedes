#!/usr/bin/perl

#Escalares '$'
print "Escalares\n";
my $perro="fido";
my $numero=20;
print $numero * $numero;
print "\n$perro*numero\n";


#Arrays '@'
print "\nArrays\n";
my @numeros=(21,55,18);
my @cosas=("silla","mesa","cuchara");
print "$numeros[0]\n";
print "$numeros[$#numeros]\n";
print "@numeros[1..$#numeros]\n";

my @ordenados=sort @numeros;
print @ordenados;


#Hashes '%'
print "\n\nHashes\n";
my %cosas=("mesa","grande","silla","fea","clave",23);
my %cosas=(
	"mesa"=>"grande",
	"silla"=>"fea",
	"clave"=>23);
print $cosas{"clave"};
my @llaves=keys %cosas;
my @valores=values %cosas;
print "\n@llaves\n";
print "@valores\n";
