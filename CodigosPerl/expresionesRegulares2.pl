#!/usr/bin/perl
use strict;
use warnings;

# Verifica que se pasen 2 argumentos
if (@ARGV != 2) {
    die "Uso: perl $0 <archivo_entrada> <archivo_salida>\n";
}

my ($archivo_entrada, $archivo_salida) = @ARGV;

open(my $in,  "<", $archivo_entrada)  or die "No se pudo abrir $archivo_entrada: $!";
open(my $out, ">", $archivo_salida)   or die "No se pudo abrir $archivo_salida: $!";

my $cont = 1;
my $a = "";

while (<$in>) {
    if (/foo/) {
        print "$archivo_entrada($cont): $_";
        $a = $_;
        $a =~ s/foo/902-A/g;
        print "$archivo_salida($cont): $a\n";
        print $out $a;
        $cont++;
    }
}

close $in;
close $out;
