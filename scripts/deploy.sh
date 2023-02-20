#!/bin/bash

if [[ $TRAVIS_BRANCH == 'site' ]] ; then
  cd _site
  git init

  git config user.name "Travis CI"
  git config user.email "rohitjain18005@gmail.com"
  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@github.com/rohitjain00/rohitjain00.github.io.git" master:master > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from site.'
  exit 1
fi
