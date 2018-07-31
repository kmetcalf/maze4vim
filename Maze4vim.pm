package Maze4vim;
use warnings;
use strict;

our $debug = 0;
my $config_file = "~/.maze4vim.conf";


sub set_debug {
	$debug = shift || 0;
}

sub show_help {
	my $extra_note = shift || '';
	print <<"EOF";
Usage:
$0 [--help] [--debug] [--level=N]
 -h | --help	Show help information and exit.
 -d | --debug	Show lots of debugging info; you probably don't want this.
 -l | --level	Begin the game at a specific level.

About:
maze4vim is a simple game that helps users learn to use vim.  Run this application
with no options to start a new game.  Instructions will be provided on the screen
to help you with navigation and other functions.

Traps:
In maze4vim, you will need to navigate the maze using the standard vim navigation
controls.  In addition, you may run across a trap which will ensare you with riddles.
If you are caught in the trap, simply solve the riddle (answer the vim usage question)
correctly to escape.

EOF
	print "\n";
	exit;
}

# WILL ATTEMPT TO LOAD THE CONFIGURATION DATA FOR THIS USER.
sub load_config {
	# 1. CREATE CONFIG FILE IF IT DOES NOT ALREADY EXIST.
	if (! -e $config_file) {
		if ($debug) { print "Config file not found at [$config_file].  Will attempt to create it... "; }
		

		print "THIS FEATURE IS NOT YET READY.\n";
	}
	# 2. READ DATA FROM CONFIG FILE.
	else {
		if ($debug) { print "Reading data from [$config_file]... "; }


		print "THIS FEATURE IS NOT YET READY.\n";
	}
	# 3. VALIDATE DATA
	if ($debug) { print "Validating configuration data... "; }



	print "THIS FEATURE IS NOT YET READY.\n";
	return 0;
}





1;
