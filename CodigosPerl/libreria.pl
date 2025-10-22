#!usr/bin/perl

use JSON;

my $json_string = '{"nombre": "Alvarado", "edad": 22, "ciudad": "Huajuapan"}';
my $perl_data = decode_json($json_string);

print "Nombre: " . $perl_data->{nombre} . "\n";
print "Edad: " . $perl_data->{edad} . "\n";

my $encoded_json = encode_json($perl_data);
print "Encoded JSON: $encoded_json\n";
