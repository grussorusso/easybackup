# easybackup #

A simple Bash script for performing an incremental backup of a set of directories
to a specified location (possibly to a remote server via SSH) through `rsync`
on Linux.

The set of directories to backup is specified through a simple text file. 
Optionally, another file may be used to provide a list of patterns to exclude
file and directories from the backup (e.g. hidden directories).

## Installation ##

It is extremely easy to get a working copy of this software:

1. Check requirements: `rsync` (and a Bash interpreter).

2. Download the script from this repository.

3. Done! You are ready to try it!

## Usage ##

Your first run of `easybackup` is made of two phases:

1. Choose the directories to be included in the backup. Prepare a file
containing absolute path of chosen directories, one per line. E.g.:

		/home/me/Documents
		/home/me/Pictures

2. Start the backup issuing the following command:

		./easybackup -s <chosen_dirs_file> -d <destination_directory>

That's it!

For a backup to a remote server (on which `rsync` is installed):

		./easybackup -s <chosen_dirs_file> -d <destination_directory> -r <server>

You can get more details about available options and what `easybackup` does, issuing:

	./easybackup -h


## Copying ##

This software is distributed under terms of GPLv3.
You can find a copy of the license in this repository.

