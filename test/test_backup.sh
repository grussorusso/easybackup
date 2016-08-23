#!/bin/bash

TEST_PREFIX="/tmp/easybackuptest"
DIR1="$TEST_PREFIX-dir1"
DIR2="$TEST_PREFIX-dir2"
LIST_FILE="$TEST_PREFIX-list"
BACKUP_DIR="$TEST_PREFIX-backup"

prepare_test()
{
	# Creates directories for test
	mkdir -p "$DIR1/subdir" 2> /dev/null
	mkdir "$DIR2" 2> /dev/null

	# Creates some files in these directories
	dd if=/dev/random bs=1500 count=10 iflag=fullblock > $DIR1/file1 2> /dev/null
	dd if=/dev/random bs=1500 count=10 iflag=fullblock > $DIR1/subdir/file2 2>/dev/null
	dd if=/dev/random bs=1500 count=10 iflag=fullblock > $DIR2/file3 2> /dev/null

	# Creates a list of files to backup
	echo $DIR1 > $LIST_FILE
	echo $DIR2 >> $LIST_FILE
}

cleanup()
{
	rm -rf $DIR1
	rm -rf $DIR2
	rm -rf $LIST_FILE
	rm -rf $BACKUP_DIR
}

verify()
{
	diff -bur $DIR1 $BACKUP_DIR$DIR1 && \
		diff -bur $DIR2 $BACKUP_DIR$DIR2

	if [[ $? -ne 0 ]]; then
		echo "TEST FAILED" >&2
		return 1
	else
		echo "OK"
		return 0
	fi
}


prepare_test

../easy-backup -s $LIST_FILE -d $BACKUP_DIR

verify
retval=$?

cleanup
exit $?
