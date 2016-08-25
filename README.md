# easy-backup #

A simple `rsync` wrapper script for performing an incremental backup of a set of directories
to a specified location (e.g. an external storage device) on Linux.

The set of directories to backup is specified through a simple text file. 
Optionally, another file may be used to provide a list of patterns to exclude
file and directories from the backup (e.g. hidden directories).

## Installation ##

It is extremely easy to get a working copy of this software:

1. **Check requirements:** `rsync` (and a Bash interpreter).

2. **Download the script**, from this repository.

## Usage ##

Your first run of `easy-backup` is made of two phases:

1. Choose the directories to be included in the backup. Prepare a file
containing absolute path of chosen directories, one per line. E.g.:

		/home/me/Documents
		/home/me/Pictures

2. Start the backup issuing the following command:

		./easy-backup -s <chosen_dirs_file> -d <destination_directory>

That's it!

You can ask for help and get more details about available options:

	./easy-backup -h


## Copying ##

This software is distributed under terms of GPLv3.
You can find a copy of the license in this repository.

