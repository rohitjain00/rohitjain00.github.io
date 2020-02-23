#!/bin/bash

jekyll build
htmlproofer ./_site --file-ignore ./_site/editor.html