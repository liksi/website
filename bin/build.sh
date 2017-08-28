#!/usr/bin/env bash
set -eu -o pipefail

# MacOS lover's, I did not forget you ;)
PROJECT_ROOT="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "\033[0;32mBuilding website...\033[0m"

# Build the project.
"$PROJECT_ROOT/hugow"
