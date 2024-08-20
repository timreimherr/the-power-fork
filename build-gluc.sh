#!/bin/sh

set -e

usage() {
    echo "Usage: build-gluc.sh <enterprise host url> <personal access token>"
    exit 1
}


# fail when no parameters are supplied
if [ ! $# -eq 2 ]
  then
    usage
fi

# printf "Cloning the-power\n"

# cd ~

# if [ -d "the-power" ]; then
#   cd "the-power"
# else
#   git clone git@github.com:gm3dmo/the-power.git && cd "$(basename "$_" .git)"
# fi

# printf "Pulling the latest version\n"

# git pull

printf "Configuring the power\n"

# process arguments supplied
printf "Server URL: $1\n"
printf "Auth token: $2\n"

python3 configure.py -n $1 -t $2

printf "Generating test data\n"

./a-create-run-for-gluc.sh