# rohitjain00.github.io

This repository hosts Rohit Jain's personal portfolio website, built with Jekyll and the `dev-portfolio-blog` theme.

## Project Structure

- `site` branch: Jekyll source files, posts, pages, configuration, and assets.
- `master` branch: Built static website files deployed to GitHub Pages.

## Local Development

Docker is the preferred local build path because it matches the pre-commit hook and does not require Ruby or Bundler on the host machine.

Build the site with Docker:

```bash
bash scripts/build-docker.sh
```

The generated site is written to `_site`.

If Ruby and Bundler are installed locally, you can also run the site with Jekyll:

```bash
bundle install
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000` unless Jekyll selects another port.

## Build

Build the website into `_site` with Docker:

```bash
bash scripts/build-docker.sh
```

Or use the legacy local build script if Ruby and Bundler are installed:

```bash
bash scripts/build.sh
```

If Ruby and Bundler are installed locally, you can also run Jekyll directly:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

## Git Hooks

This repo includes a tracked pre-commit hook in `.githooks/pre-commit`.

Enable it once per clone:

```bash
git config core.hooksPath .githooks
```

On the `site` branch, the hook runs a production Jekyll build in Docker before each commit. Docker Desktop must be installed and running, but Ruby and Bundler do not need to be installed on the host machine.

## Publishing

GitHub Pages publishes the built static site from the `master` branch. Do not edit `master` directly.

The source of truth is the `site` branch. The workflow in `.github/workflows/main.yml` runs on every push to `site`, builds the Jekyll site, and publishes `_site` to `master` using `peaceiris/actions-gh-pages`.

Publish checklist:

```bash
git checkout site
git status
git add <changed-files>
git commit -m "Describe the site change"
git push origin site
```

What happens next:

1. The pre-commit hook runs `scripts/build-docker.sh`.
2. The commit is created only if the Docker build succeeds.
3. `git push origin site` triggers GitHub Actions.
4. GitHub Actions deploys the generated `_site` output to `master`.
5. GitHub Pages serves the updated `master` branch at `https://therohitjain.com`.

Check the deployment run:

```bash
gh run list --branch site --limit 3
```

Verify the live site:

```bash
curl -L https://therohitjain.com/about/
```

You can also trigger the workflow manually from the GitHub Actions tab because it includes `workflow_dispatch`.

## Theme

This website uses the `dev-portfolio-blog` Jekyll theme:

<https://github.com/rohitjain00/dev-portfolio-blog>
