#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
use File::Basename;
use lib dirname (__FILE__);
use Maze4vim;


my $help = 0;
my $debug = 0;
my $level = 1;

GetOptions (
	"h|help"	=> \$help,
	"l|level=i"	=> \$level,
	"d|debug"	=> \$debug,
) or show_help("Error processing command line arguments.\n");

if ($help == 1) { Maze4vim::show_help(); }
if ($debug == 1) { Maze4vim::set_debug(1); }

if ($debug) { print "Loading configuration data... "; }
if (Maze4vim::load_config()) { if ($debug) { print "Success.\n"; } }
else { die "Error.\n\nCould not load configuration data!\n"; }


print "Building the maze...\n";

