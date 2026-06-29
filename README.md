# rohitjain00.github.io

This repository hosts Rohit Jain's personal portfolio website, built with Jekyll and the `dev-portfolio-blog` theme.

## Project Structure

- `site` branch: Jekyll source files, posts, pages, configuration, and assets.
- `master` branch: Built static website files deployed to GitHub Pages.

## Local Development

Install dependencies:

```bash
bundle install
```

Run the website locally:

```bash
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000` unless Jekyll selects another port.

## Build

Build the website into `_site`:

```bash
bash scripts/build.sh
```

Or build with Docker, without installing Ruby locally:

```bash
bash scripts/build-docker.sh
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

## Deployment

GitHub Actions deploys the site automatically.

The workflow in `.github/workflows/main.yml` runs on every push to the `site` branch. It installs Ruby, builds the Jekyll site, and publishes `_site` to the `master` branch using `peaceiris/actions-gh-pages`.

To publish changes:

```bash
git push origin site
```

After the workflow finishes, GitHub Pages serves the updated `master` branch.

You can also trigger the workflow manually from the GitHub Actions tab because the workflow includes `workflow_dispatch`.

## Theme

This website uses the `dev-portfolio-blog` Jekyll theme:

<https://github.com/rohitjain00/dev-portfolio-blog>
