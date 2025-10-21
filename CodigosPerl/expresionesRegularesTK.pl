#!/usr/bin/perl
use strict;
use warnings;
use Tk;
use Tk::FileSelect;

# --- Crear ventana principal ---
my $mw = MainWindow->new;
$mw->title("Procesar archivo con Perl/Tk");

# Variables para guardar las rutas
my ($archivo_entrada, $archivo_salida);

# --- Etiquetas y botones ---
$mw->Label(-text => "Selecciona los archivos")->pack(-pady => 10);

# Botón para seleccionar archivo de entrada
$mw->Button(
    -text    => "Seleccionar archivo de entrada",
    -command => sub {
        my $fs = $mw->FileSelect(-title => "Seleccionar archivo de entrada");
        my $file = $fs->Show;
        $archivo_entrada = $file if defined $file;
    }
)->pack(-pady => 5);

# Botón para seleccionar archivo de salida
$mw->Button(
    -text    => "Seleccionar archivo de salida",
    -command => sub {
        my $fs = $mw->FileSelect(-title => "Seleccionar archivo de salida");
        my $file = $fs->Show;
        $archivo_salida = $file if defined $file;
    }
)->pack(-pady => 5);

# Botón para ejecutar el procesamiento
$mw->Button(
    -text    => "Procesar",
    -command => \&procesar_archivos
)->pack(-pady => 15);

# --- Subrutina principal ---
sub procesar_archivos {
    unless ($archivo_entrada && $archivo_salida) {
        $mw->messageBox(
            -message => "Debes seleccionar ambos archivos antes de continuar.",
            -icon    => 'error',
            -type    => 'ok'
        );
        return;
    }

    open(my $in,  "<", $archivo_entrada) or do {
        $mw->messageBox(-message => "No se pudo abrir $archivo_entrada: $!", -icon => 'error');
        return;
    };
    open(my $out, ">", $archivo_salida) or do {
        $mw->messageBox(-message => "No se pudo abrir $archivo_salida: $!", -icon => 'error');
        return;
    };

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

    $mw->messageBox(
        -message => "Procesamiento completado.\nSalida guardada en:\n$archivo_salida",
        -icon    => 'info',
        -type    => 'ok'
    );
}

MainLoop;
