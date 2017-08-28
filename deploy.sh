#!/usr/bin/env bash
set -eu -o pipefail

# MacOS lover's, I did not forget you ;)
PROJECT_ROOT="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)"

REPO="git@github.com:liksi/liksi.github.io.git"

cd "$PROJECT_ROOT"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Go To Public folder
cd "$PROJECT_ROOT/public"


if [[ -z $GIT_COMMIT ]]; then
  GIT_COMMIT=$(cd ..; git rev-parse --verify HEAD)
fi


# Add changes to git.
git add --all

# Commit changes.
git commit -m "Deploy $(cd ..; echo -n "liksi/website@"; git show --oneline -s $GIT_COMMIT)"

# Push source and build repos.
git push origin master

