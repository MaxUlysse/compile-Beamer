#!/bin/bash
set -xeuo pipefail

TOOL="all"

while [[ $# -gt 0 ]]
do
  key=$1
  case $key in
    -t|--tool)
    TOOL=$2
    shift # past argument
    shift # past value
    ;;
    *) # unknown option
    shift # past argument
    ;;
  esac
done

# Install Nextflow
if [[ all,nextflow =~ $TOOL ]]
then
  cd ${HOME}
  curl -fsSL get.nextflow.io | bash
  chmod +x nextflow
  sudo mv nextflow /usr/local/bin/
fi

# Install Singularity
if [[ all,singularity =~ $TOOL ]]
then
  cd ${HOME}
  wget https://github.com/singularityware/singularity/releases/download/${SGT_VER}/singularity-${SGT_VER}.tar.gz
  tar xvf singularity-${SGT_VER}.tar.gz
  cd singularity-${SGT_VER}
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm -rf singularity-${SGT_VER}*
fi
