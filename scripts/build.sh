#!/bin/bash

export BUNDLE_GEMFILE="$(pwd)/Gemfile"
bundle exec jekyll build
# htmlproofer ./_site --file-ignore ./_site/editor.html --url-ignore "/www.github.com/*,/www.linkedin.com/*,/www.jiit.ac.in/*"