#!/usr/bin/perl -w

use strict 'refs';
use strict 'subs';

# Verificar si se pasaron los 3 parámetros correctamente
if ($#ARGV != 2) {
    &usage;
    exit;
}

# Definir las variables
my $file = $ARGV[0];
my $word = $ARGV[1];
my $lines = $ARGV[2];

# Abrir el archivo para escritura
open(my $out, ">", $file) or die "No se pudo abrir $file: $!";

# Llamar a la subrutina con los parámetros necesarios
&guada($file, $word, $lines);

exit;

sub usage {
    print STDERR "usage: $0 <file> <word> <lines>\n";
    exit;
}

# Subrutina para trabajar con los 3 parámetros de entrada
sub guada {
    my ($file, $word, $lines) = @_;
    
    print "\nSubrutina para trabajar con los 3 parametros de entrada\n";
    print "Se escribirá $lines veces la palabra: '$word' en el archivo '$file'\n";
    
    # Escribir la palabra en el archivo el número de veces especificado
    for (my $i = 0; $i < $lines; $i++) {
        print $out $word;
    }

    print $out "\n";    
    print "Operación realizada con éxito\n";
    
    # Cerrar el archivo
    close($out);
}
