# Easy rsync backup #

A simple Bash script for performing a backup of a set of directories
to a specified location (e.g. an external storage device).

## Requirements ##

In order to run this backup script, `rsync` must be installed on your system.

## Installation ##

It is enough to download the script to your system. However, it might be useful to put
the script in a directory included in your `PATH`.

## Usage ##

Choose the directories to be included in backup operation. Prepare a file
with chosen directory paths, one per line. Absolute paths are recommended. E.g.:

	/home/me/Documents
	/home/me/Pictures

You can start the backup with following command:

	easy-backup -s sources_file_name -d /my/backup/destination/ 


## Author ##

This script was developed by Gabriele Russo Russo. It is distributed under 
terms of GPLv3. You can find a copy of the license in this repository.

