#!/bin/bash
set -xeuo pipefail

PROFILE="docker"

while [[ $# -gt 1 ]]
do
    key="$1"
    case $key in
        -p|--profile)
        PROFILE="$2"
        shift
        ;;
        *) # unknown option
        ;;
    esac
    shift
done

# Install Singularity
if [ $PROFILE = singularity ]
then
  ./scripts/install.sh -t singularity
fi

nextflow run . -profile $PROFILE
