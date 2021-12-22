#!/usr/bin/env bash

die () {
    echo >&2 "$@"
    exit 1
}

print_usage() {
  printf "Usage: createvhost [OPTIONS] [store-name]\n"
  printf "\n  -e"
  printf "\n\t\tenable vhost after creation and restart apache"
  printf "\n"
}

if [ $# -eq 0 ]
  then
    print_usage
    exit 1
fi

AUTO_ENABLE=false

while getopts 'e' flag; do
  case "${flag}" in
    e) AUTO_ENABLE=true ;;
    *) print_usage
       exit 1 ;;
  esac
done

STORE_NAME="${@: -1}"
SITES_AVAILABLE_DIR="/etc/apache2/sites-available"
VHOST_FILENAME="${STORE_NAME}.nl.localhost"
VHOST_FILENAME_FULL="${VHOST_FILENAME}.conf"
NEW_VHOST_PATH="${SITES_AVAILABLE_DIR}/${VHOST_FILENAME_FULL}"

#create vhost
sudo cp ./vhost.example "${NEW_VHOST_PATH}"
sudo sed -i -e "s/REPLACE_ME_PLS/$STORE_NAME/g" "${NEW_VHOST_PATH}"
echo "Created ${STORE_NAME} at ${NEW_VHOST_PATH}"

#enable vhost
if [ "$AUTO_ENABLE" = true ] ; then
	sudo a2ensite "${VHOST_FILENAME}"
	echo "Enabled ${VHOST_FILENAME}"
	sudo systemctl restart apache2
	echo "Restarted apache"
fi
