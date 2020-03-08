#!/bin/bash

jekyll build
htmlproofer ./_site --file-ignore ./_site/editor.html --url-ignore "feed.xml,/facebook.com/,/freecodecamp.org/, /github.com/, /linkedin.com/"