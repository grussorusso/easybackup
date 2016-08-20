# easy-backup #

A simple `rsync` wrapper script for performing a backup of a set of directories
to a specified location (e.g. an external storage device) on Linux.

## Installation ##

**Requirements:** `rsync` (and a Bash interpreter).

It is enough to download the script to your system, cloning this repository. 
Then, it might be useful to put
the script in a directory included in your `PATH`.

## Usage ##

Choose the directories to be included in backup. Prepare a file
with chosen directory paths, one per line. Absolute paths are required. E.g.:

	/home/me/Documents
	/home/me/Pictures

You can start the backup with following command:

	./easy-backup -s sources_file -d /my/backup/destination/ 


*This software is distributed under terms of GPLv3.*
*You can find a copy of the license in this repository.*

