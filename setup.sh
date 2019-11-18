#!/usr/bin/env bash

# Set env vars
export DEVSHELL_PROJECT_ID="gke-${USER}"
export GOOGLE_PROJECT_ID="gke-${USER}"

# Set the project in gcloud
gcloud config set project "gke-${USER}"

# Fetch the cluster location
LOCATION="$(gcloud container clusters list --format='value(location)')"

# Fetch a valid kubeconfig
gcloud container clusters get-credentials --zone="${LOCATION}" "gke-${USER}"
