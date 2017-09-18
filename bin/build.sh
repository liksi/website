#!/usr/bin/env bash
set -eu -o pipefail

# MacOS lover's, I did not forget you ;)
PROJECT_ROOT="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "Building website..."

# Update git submodules
# echo -e "Updating Git submodules"
# git submodule init
# git submodule update

# Go To Public folder
cd "$PROJECT_ROOT/public"

git pull origin master

# Build the project.
"$PROJECT_ROOT/hugow"
