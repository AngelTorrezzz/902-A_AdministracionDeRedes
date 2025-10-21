#! /usr/bin/perl

require Tk;

use Tk;

my $win = MainWindow -> new();

$win ->configure(-title=>'Hola Amigos');

my $button = $win -> Button(-text => "Como estan?",

-command => sub { exit })

-> pack();

MainLoop();
