#!/usr/bin/env bash
#
# This script can be used both manually and from a CI
# build pipeline with a deploy key set up.
#
# Variables:
# - FORCE_UPDATE
#	When not empty, will ignore uncomitted changes
#	an the git references being the same.
#	Example: FORCE_UPDATE=y ./deploy.sh

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Check our dependencies.
if [ -z "$(which hugo)" ]; then
	echo "Hugo must be installed and available in \$PATH"
	exit 1
fi
if [ -z "$(which git)" ]; then
	echo "Git must be installed and available in \$PATH"
	exit 1
fi

# Make sure we're in the project root.
toplevel="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
cd "${toplevel}"

# Check we're not in a dirty state.
dirty_files=$(git status --porcelain --ignore-submodules 2> /dev/null)
if [ -z "$FORCE_UPDATE" ] && [ ! -z "$dirty_files" ]; then
  echo "Looks like you have uncommitted changes, aborting."
  echo "$dirty_files"
  exit 1
fi

# Ensure we have any required submodules.
git submodule update --init --recursive || exit 1

# For the sources we want to have the latest upstream data.
git submodule update --init --remote sources/* || exit 1

# Force checkout the remote public branch (detached).
git submodule update --init --remote --checkout public || exit 1

# Load the .git file contents into memory, as hugo's --cleanDestinationDir will break the submodule.
git_public_content="$(cat public/.git)"

# Update our workgroups content from the submodule data.
./scripts/update-workgroups.sh

# Build the project into the submodule.
hugo -s . -d ./public --config config.toml --cleanDestinationDir

# Restore the .git file.
echo "$git_public_content" > public/.git

# Track the SHA we've built from.
echo "$(git rev-parse --verify HEAD)" > public/.HEAD

# Go To public folder
cd ./public

# Push public repo from the detached head.
git add --all
git commit -m "Rebuilding site `date`"
git push origin HEAD:gh-pages
