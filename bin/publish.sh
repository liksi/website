#!/usr/bin/env bash
set -eu -o pipefail

# MacOS lover's, I did not forget you ;)
PROJECT_ROOT="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)"
PUBLIC_DIR=$PROJECT_ROOT/public

REPO="git@github.com:liksi/liksi.github.io.git"

echo -e "\033[0;32mMoving to generated directory $PUBLIC_DIR...\033[0m"

# Go To Public folder
cd "$PROJECT_ROOT/public"


if [[ -z $GIT_COMMIT ]]; then
  GIT_COMMIT=$(cd ..; git rev-parse --verify HEAD)
fi

# Add changes to git.
git add --all


# Commit changes.
echo -e "Commit of generated files..."
git commit -m "Deploy $(cd ..; echo -n "liksi/website@"; git show --oneline -s $GIT_COMMIT)"

# Push source and build repos.
echo -e "Deploying updates to GitHub $GIT_COMMIT..."
git push origin master

