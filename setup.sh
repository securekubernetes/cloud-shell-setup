#!/usr/bin/env bash

# Set env vars
export DEVSHELL_PROJECT_ID="nik-${USER}"
export GOOGLE_PROJECT_ID="nik-${USER}"

# Set the project in gcloud
gcloud config set project "nik-${USER}"

# Fetch the cluster location
LOCATION="$(gcloud container clusters list --format='value(location)')"

# Fetch a valid kubeconfig
gcloud container clusters get-credentials --zone="${LOCATION}" "nik-${USER}"

if ! [ -x "$(command -v nmap)" ]; then
  echo -n "Installing nmap..."
  sudo DEBIAN_FRONTEND=noninteractive apt-get update -q 1> /dev/null 2> /dev/null
  sudo DEBIAN_FRONTEND=noninteractive apt-get install nmap -y -q 1> /dev/null 2> /dev/null
  echo "done."
  exit 1
fi
