package Maze4vim;
use warnings;
use strict;
use File::Basename;

our $debug =	0;
our $level =	0;
our $name =	"";
our $traps =	1;
our $monsters = 1;

our $data_dir = dirname (__FILE__);

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

		if ($config_data =~ /^level=(.+?)$/mi)		{ $level = $1; }
		if ($config_data =~ /^name=(.+?)$/mi)		{ $name = $1; }
		if ($config_data =~ /^traps=(.+?)$/mi)		{ $traps = $1; }
		if ($config_data =~ /^monsters=(.+?)$/mi)	{ $monsters = $1; }
		if ($debug) { print "Success.\nRead: Level: $level, Name: $name, Traps: $traps, Monsters: $monsters\n"; }

	}

	# 3. VALIDATE DATA
	if ($debug) { print "Validating configuration data... "; }
	unless ($level >= 0) { die "Level from config file must be a number.\n\n"; }
	unless (($traps == 0) or ($traps == 1)) { die "Traps from config file must be either 0 or 1.\n\n"; }
	unless (($monsters == 0) or ($monsters == 1)) { die "Monsters from config file must be either 0 or 1.\n\n"; }

	return 1;
}


sub load_maze() {
	my $level_filename = $data_dir . '/mazes/level' . $level;
	unless (-e $level_filename) { die "Could not find file at [$level_filename].\n\n"; }
	local $/;
	open(my $fh, '<', $level_filename) or die "Could not open file $level_filename: $!\n\n";
	my $level_data = <$fh>;
	close $fh;

	$level_data =~ s/^\s*start\s*[:=]\s*(.+?)\s*$//mi;
	my $start_location = $1;
	if ($debug) { print "Starting at $start_location.\n"; }

	$level_data =~ s/^\s*end\s*[:=]\s*(.+?)\s*$//mi;
	my $end_location = $1;
	if ($debug) { print "Ending at $end_location.\n"; }


print "Remaining maze data looks like:\n---\n$level_data---\n";
	return 0;
}



1;
