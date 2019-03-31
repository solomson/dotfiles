#!/bin/bash
debug="$(jq -r '.debug' "${PREVIOUS_PWD}"/bootstrap/settings.json)"
if [ "${debug}" == true ]; then
	# Disable exit on non 0
	set +e
else
	# Enable exit on non 0
	set -e
fi
HEADER_TYPE="$(uname -s)"
ARCHITECTURE_TYPE="$(uname -m)"
ANACONDA_VERSION="$(jq -r '.anaconda' "${PREVIOUS_PWD}"/bootstrap/settings.json)"
if [ "$(jq -r '.purge' "${PREVIOUS_PWD}"/bootstrap/settings.json)" == true ] ; then
	echo "Anaconda purge not implemented yet! Skipping."
fi
if ! curl https://repo.anaconda.com/archive/Anaconda"${ANACONDA_VERSION}"-"${HEADER_TYPE}"-"${ARCHITECTURE_TYPE}".sh | bash
then
	echo "Anaconda Download failed! Skipping."
	exit 1
fi
wait
bash
