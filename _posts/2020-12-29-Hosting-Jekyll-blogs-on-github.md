---
layout: post
comments: true
title : How to Host Jekyll Blogs on GitHub Pages Using GitHub Actions
categories: [Jekyll, Deployment]
---

If you are reading this blog, I am assuming that you are already familiar with Jekyll and want to automate publishing your blog online.

This site now uses GitHub Actions to build the Jekyll source from the `site` branch and publish the generated `_site` output to the `master` branch, which GitHub Pages serves.

## What are we going to do?

We will use a GitHub Actions workflow to:

1. Run every time a commit is pushed to the `site` branch.
2. Install Ruby and the Jekyll dependencies.
3. Build the site with `bundle exec jekyll build`.
4. Deploy the generated `_site` directory to the `master` branch.

## Repository structure

This setup uses two branches:

1. `site` - the source branch containing the Jekyll project, posts, pages, and configuration.
2. `master` - the generated static site that GitHub Pages publishes.

Set the repository's default development branch to `site`, then configure GitHub Pages to publish from the `master` branch.

## GitHub Actions workflow

Create `.github/workflows/main.yml` with the following content:

```yml
name: Build and deploy site

on:
  push:
    branches:
      - site
  workflow_dispatch:

permissions:
  contents: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.3"
          bundler-cache: true

      - name: Build
        env:
          JEKYLL_ENV: production
        run: bundle exec jekyll build

      - name: Deploy to master
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_site
          publish_branch: master
```

This workflow does not need a personal access token for normal same-repository deployments. GitHub provides `GITHUB_TOKEN` automatically, and the workflow grants it `contents: write` permission so it can update the publishing branch.

## How the deployment works

When you push a commit to `site`, GitHub Actions starts a new build. If another Pages build is already running, the `concurrency` setting cancels the older one and keeps the newest commit moving forward.

After the build succeeds, `peaceiris/actions-gh-pages` commits the generated files from `_site` to `master`. GitHub Pages then serves the updated static site from that branch.

You can also run the same deployment manually from the Actions tab because the workflow includes `workflow_dispatch`.

## Local development

Install dependencies:

```bash
bundle install
```

Run the site locally:

```bash
bundle exec jekyll serve
```

Build the production site:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

At this point, every commit pushed to the `site` branch should trigger a fresh website build and publish the result to GitHub Pages.
