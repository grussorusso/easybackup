# Test #

This directory contains script(s) for testing `easybackup`.

At the moment a single script exists and it is extremely simple. It
creates a few files and directories in `/tmp` and fills them with random
bytes from `/dev/random` (using `dd`). Then, it runs `easybackup` to make
a backup of those files. Backup success is verified running `diff -bur` on
directories involved in backup.

The script is really simple, since it only checks files' content (no
		permissions or other metadata).

## Usage ##

Run the test with:
	
	./test_backup.sh
