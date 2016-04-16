# Performs backup of specified directories to given destination,
# using rsync.
#
# Author: Gabriele Russo Russo (2015)

# Folder for backup (must NOT end with a / )
BACKUP_FOLDER='./BackupDir'

# rsync options
RSYNC_OPT='-aShR --delete'

# Sources (absolute paths, must NOT end with a / )
SOURCES=( '/home/gabriele/Scripts' \
		'/home/gabriele/Immagini' )

for src in "${SOURCES[@]}"
do
	echo "Syncing: ${src}"
	rsync $RSYNC_OPT $src ${BACKUP_FOLDER}/
done
