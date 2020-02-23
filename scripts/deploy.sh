#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' ]] ; then
  cd _site
  git init

  git config user.name "Travis CI"
  git config user.email "rohitjain18005@gmail.com"
  git checkout -b gh-pages
  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://rohitjain00:${GH_TOKEN}@github.com/rohitjain00/rohitjain.github.io.git" gh-pages:gh-pages > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from master.'
  exit 1
fi