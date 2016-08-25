#!/bin/bash

TEST_PREFIX="/tmp/easybackuptest"
DIR1="$TEST_PREFIX-dir1"
DIR2="$TEST_PREFIX-dir2"
DIR3="$TEST_PREFIX-dir3"
LIST_FILE="$TEST_PREFIX-list"
EXCLUDED_PATTERNS_FILE="$TEST_PREFIX-excluded"
BACKUP_DIR="$TEST_PREFIX-backup"

prepare_test()
{
	rm -rf $BACKUP_DIR

	# Creates directories for test
	mkdir -p "$DIR1/subdir" 2> /dev/null
	mkdir "$DIR2" 2> /dev/null
	mkdir -p "$DIR3/excluded" 2> /dev/null

	# Creates some files in these directories
	dd if=/dev/random bs=1500 count=5 iflag=fullblock > $DIR1/file1 2> /dev/null
	dd if=/dev/random bs=1500 count=5 iflag=fullblock > $DIR1/subdir/file2 2>/dev/null
	dd if=/dev/random bs=1500 count=5 iflag=fullblock > $DIR2/file3 2> /dev/null
	dd if=/dev/random bs=1500 count=5 iflag=fullblock > $DIR3/file4 2> /dev/null
	dd if=/dev/random bs=1500 count=5 iflag=fullblock > $DIR3/excluded/file5 2> /dev/null

	# Creates a list of files to backup
	echo $DIR1 > $LIST_FILE
	echo $DIR2 >> $LIST_FILE
	echo $DIR3 >> $LIST_FILE

	# Creates a file with excluded patterns
	echo '*/excluded/*' > $EXCLUDED_PATTERNS_FILE
}

cleanup()
{
	rm -rf $DIR1
	rm -rf $DIR2
	rm -rf $DIR3
	rm -f $LIST_FILE
	rm -f $EXCLUDED_PATTERNS_FILE
	rm -rf $BACKUP_DIR
}

verify()
{
	# Verifies DIR2 backup
	diff -bur $DIR1 $BACKUP_DIR$DIR1 && \
		diff -bur $DIR2 $BACKUP_DIR$DIR2

	echo "Verifying backup of DIR1 and DIR2..."
	if [[ $? -ne 0 ]]; then
		echo "TEST FAILED" >&2
		return 1
	fi

	# Verifies DIR3 backup
	echo "Verifying backup of file in DIR3..."
	diff $DIR3/file4 $BACKUP_DIR$DIR3/file4
	if [[ $? -ne 0 ]]; then
		echo "TEST FAILED" >&2
		return 1
	fi

	echo "Verifying excluded patterns in DIR3..."
	if [[ -f $BACKUP_DIR$DIR3/excluded/file5 ]]; then
		echo "TEST FAILED" >&2
		return 1
	else
		echo "TEST OK"
		return 0
	fi
}


prepare_test

../easy-backup -s $LIST_FILE -d $BACKUP_DIR -e $EXCLUDED_PATTERNS_FILE

verify
retval=$?

cleanup
exit $?
