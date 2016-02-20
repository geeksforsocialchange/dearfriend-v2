#!/bin/bash

# If any command errors, fail Travis
set -e

# Define variables depending on the branch
if [[ $TRAVIS_BRANCH == 'master' ]]
  then
    REPO="github.com/kimadactyl/dearfriend.org.uk"
    DOMAIN="dearfriend.org.uk"
  else
    REPO="github.com/kimadactyl/dev.dearfriend.org.uk"
    DOMAIN="dev.dearfriend.org.uk"
fi

# Get the commit details
THE_COMMIT=`git rev-parse HEAD`

# Set git details
git config --global user.email "kim@alliscalm.net"
git config --global user.name "Travis CI"

# Run gulp
gulp deploy --debug --production

# Move to created directory
cd _dist

# Create CNAME file and populate with domain depending on branch
cat > CNAME << EOF
$DOMAIN
EOF

# Push to git by overriding previous commits
# IMPORTANT: Supress messages so nothing appears in logs
if [[ $TRAVIS_BRANCH == 'master' ]]; then
  git init
  git add -A
  git commit -m "Travis CI automatic build for $THE_COMMIT"
  git push --force --quiet "https://${GH_TOKEN}@${REPO}" master > /dev/null 2>&1
elif [[ $TRAVIS_BRANCH == 'develop' ]]; then
  git init
  git add -A
  git commit -m "Travis CI automatic build for $THE_COMMIT"
  git push --force --quiet "https://${GH_TOKEN}@${REPO}" master:gh-pages > /dev/null 2>&1
else
  echo "Not on master or develop branch so do not publish the website to GitHub Pages"
fi
