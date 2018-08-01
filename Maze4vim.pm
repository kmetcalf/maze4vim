package Maze4vim;
use warnings;
use strict;

our $debug =	0;
our $level =	0;
our $name =	"";
our $traps =	1;
our $monsters = 1;

my $config_file = "$ENV{HOME}/.maze4vim.conf";


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
		my $default_config = "level=$level\nname=$name\ntraps=$traps\nmonsters=$monsters\n";

		open(my $fh, '>', $config_file) or die "Could not open file $config_file: $!\n\n";
		print $fh $default_config or die "Could not write to $config_file: $!\n\n";
		close $fh;
	}
	# 2. READ DATA FROM CONFIG FILE.
	else {
		if ($debug) { print "Reading data from [$config_file]... "; }

		local $/;
		open(my $fh, '<', $config_file) or die "Could not open file $config_file: $!\n\n";
		my $config_data = <$fh>;
		close $fh;

print "Read file: $config_data\n";

		if ($config_data =~ /^level=(.+?)$/mi)		{ $level = $1; }
		if ($config_data =~ /^name=(.+?)$/mi)		{ $name = $1; }
		if ($config_data =~ /^traps=(.+?)$/mi)		{ $traps = $1; }
		if ($config_data =~ /^monsters=(.+?)$/mi)	{ $monsters = $1; }
		if ($debug) { print "Success.\nRead: Level: $level, Name: $name, Traps: $traps, Monsters: $monsters\n"; }

	}
	# 3. VALIDATE DATA
	if ($debug) { print "Validating configuration data... "; }



	print "THIS FEATURE IS NOT YET READY.\n";
	return 0;
}





1;
