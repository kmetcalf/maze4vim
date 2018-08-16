#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
use File::Basename;
use lib dirname (__FILE__);
use Maze4vim;

# SET DEFAULTS FOR COMMAND LINE OPTIONS.
my $help = 0;
my $debug = 0;
my $level = 1;

# READ AND SET COMMAND LINE OPTIONS.
GetOptions (
	"h|help"	=> \$help,
	"l|level=i"	=> \$level,
	"d|debug"	=> \$debug,
) or show_help("Error processing command line arguments.\n");
if ($help == 1) { Maze4vim::show_help(); }
if ($debug == 1) { Maze4vim::set_debug(1); }
if ($level != 0) { Maze4vim::set_level($level); }

# READ CONFIGURATION DATA FOR THIS USER ACCOUNT.
if ($debug) { print "Loading configuration data... "; }
if (Maze4vim::load_config()) { if ($debug) { print "Success.\n"; } }
else { die "Error.\n\nCould not load configuration data!\n"; }

# READ THE MAZE FILE FOR THIS LEVEL.
if ($debug) { print "Loading maze data... "; }
if (Maze4vim::load_maze()) { if ($debug) { print "Success.\n"; } }
else { die "Error.\n\nCould not load maze data: $!\n"; }

print "Building the maze...\n";

