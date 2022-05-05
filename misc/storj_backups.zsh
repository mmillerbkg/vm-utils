#!/bin/zsh

# Set variables
# Backup directory/directory that will be uploaded
BACKUP_DIR=$HOME/backups

# Storj Bucket to upload to
STORJ_BUCKET=backups

usage()
{
  echo "Usage: [-b <string> storj bucket name] [-d <string> directory to backup]"
  exit 0
}

main()
{
  # Welcome friend
  echo "Starting backups\nBackup Directory: ${BACKUP_DIR}\nStorj Bucket: $STORJ_BUCKET"

  for file in $BACKUP_DIR/*; do
        FILENAME=$file:t

        if [[ -f $file ]] && [[ $file != *".zsh" ]]; then
                # Check if file already exists in uplink bucket
                if uplink ls sj://$STORJ_BUCKET | grep -Fq "$FILENAME"; then
                        echo "$FILENAME already exists in Storj bucket ${STORJ_BUCKET} \nSkipping.."
                else
                        uplink cp $file sj://$STORJ_BUCKET
                fi
        fi
  done
}

while getopts ":b:d:" o; do
        case "${o}" in
                b)
                  if uplink ls | grep -Fq "${OPTARG}"; then
                    STORJ_BUCKET=$OPTARG
                  else
                    echo "Could not find specificied Storj bucket, please try again"
                    exit 0;
                  fi
                  ;;

                d)
                  if [[ -d ${OPTARG} ]]; then
                    BACKUP_DIR=${OPTARG}
                  else
                          echo "Could not find specified backup directory, please try again"
                          exit 0;
                  fi
                  ;;

                *)
                  usage
                  ;;
        esac
done

shift $((OPTIND-1))

main