#!/bin/bash
#
# Using backup-manager to upload
#
#  bash /var/www/dev-box/roles/dropbox/templates/backupPostgresToDropbox.sh.tpl kallzenter postgresql /var/www/kallzenter/
#
#

DATABASE=$1

CONNECTION=$2

APP_PATH=$3

YEAR="$(date +'%Y')"

MONTH="$(date +'%m')"

NOW="$(date +'%Y-%m-%dT%H-%M-%S')"

FILE="$HOSTNAME-$DATABASE-$NOW.postgresql.backup.gz"

LOCAL_PATH="/tmp/$FILE"

REMOTEPATH="/servers/$HOSTNAME/backup/databases/$DATABASE/$YEAR/$MONTH/$FILE"

#echo "Creating backup to $LOCAL_PATH..."

#pg_dump $DATABASE | gzip > $LOCAL_PATH

echo "Uploading to Dropbox: $REMOTEPATH..."

#dropbox_uploader.sh upload $LOCAL_PATH $REMOTEPATH
#
/usr/bin/php $APP_PATH/artisan db:backup --database=$CONNECTION --destination=dropbox --destinationPath=$REMOTEPATH --compression=gzip

#echo "Deleting local file $LOCAL_PATH..."

#rm $LOCAL_PATH

echo ""
echo "All DONE!"
echo ""

