---
layout: post
comments: true
title : How to Host Jekyll Blogs on Github Pages Using Travis
categories: [Jekyll, Deployment]
---

If you're reading this blog I'm assuming that you're already familiar with Jekyll and looking for a way to automate the process of hosting your blog online.

## What are we going to do?
We're using a third party app called `Travis CI` to automatically publish our blog to the `github pages`.

#### [Travis CI](https://travis-ci.com/)
  As specified in the name 'CI' stands for `Continous Integration`. It is a hosted continous integration service used to build and test software projects. Also, it's Free ;)

#### [Github Pages](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages)
  GitHub Pages is a static site hosting service that takes HTML, CSS, and JavaScript files straight from a repository on GitHub, optionally runs the files through a build process, and publishes a website.

## How will the whole thing work?
After linking the github with Travis, it will automatically determine the public repos with a `.travis.yml` file and executes the file. When there is a change in the repository(like a new commit), the whole build process is triggered. So everytime we make changes to our blog, travis sees the changes and builds a new version of the website.

The part of the process is to automate the pushing of the website to the github repo. For this we need a way for Travis to access and commit to the github repository. This can be done with a personal access token ([PAT](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)) on Github. We provide Travis with the PAT and now it can push back to the Git repo.

**So now we need to tell Travis to setup the ruby environment, build the blog and push the code back to the git repo.**

## Follow the steps below to add automation to your Jekyll blog

**1. Create an branch `site` and set it as defualt branch on Github. ([GH docs](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/changing-the-default-branch))**

**2. Create a `.travis.yml` file in your root directory with the following data.**

```yml
// travis.yml
language: ruby
rvm:
- 2.6.5

before_install:
- chmod +x scripts/build.sh # makes the scripts executable
- chmod +x scripts/deploy.sh # makes the scripts executable

script: scripts/build.sh

# branch whitelist
branches:
  only:
  - site     # test the gh-pages branch

deploy:
  skip_cleanup: true
  provider: script
  script: scripts/deploy.sh
  on:
    branch: site
```
In the config above we did the following
1. Setup a ruby environment.
2. Set the script's permission to be executable.
3. Only work when pushed to the branch `site`
4. At the time of deploying use a script instead of the default way to deploy and provided the script's path.

**3. Create a folder `scripts` in your root directory with the two scripts file `build.sh` and `deploy.sh`**

**`build.sh`**

```yml
#!/bin/bash

// build.sh
jekyll build
```

This script bacially just builds the jekyll blog.

**`deploy.sh`**
```yml
#!/bin/bash

// deploy.sh
if [[ $TRAVIS_BRANCH == 'site' ]] ; then
  cd _site
  git init

  git config user.name "Travis CI"
  git config user.email "dummy@gmail.com"
  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@github.com/{GITHUB_USERNAME}/{GITHUB_REPO_NAME}.git" master:master > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from site.'
  exit 1
fi

```
Replace the `GITHUB_USERNAME` and `GITHUB_REPO_NAME` with your repo's details.

This script does the following
1. First it checks if the branch used is `site`.
2. With the build script above the site is built in `_site` folder.
3. It initialises the `_site` as a git repo, sets the git configs.
4. It uses the `GH_TOKEN` env variable which we need to setup in the Travis(Step 4). See [PAT](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)
5. To make sure that we don't print the access token we make the output to ` /dev/null 2>&1`. It will bascially hide the output.

**4. Now you need to create a new personal access token on the github** [Refer to GH docs](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)

**5. In the Travis go to your repository and create a new enviornment variable with name `GH_TOKEN` and set the value to the token you just generated.**

**6. Set the gh-pages publishing branch to the master. Refer to this guide [here](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)**

At this point, if you create a new commit to your repo, it should trigger a new build on Travis and after a few minutes you should be able to view your blog online.

Let me know in the comments if you face any difficulty while following this guide.
