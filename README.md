[![Build Status](https://travis-ci.org/rohitjain00/rohitjain00.github.io.svg?branch=master)](https://travis-ci.org/rohitjain00/rohitjain00.github.io)

# rohitjain00.github.io

This repository hosts Rohit Jain's personal portfolio website, built using Jekyll and the `dev-portfolio-blog` theme.

## Project Structure

- `site` branch: Contains the source code for the Jekyll website.
- `master` branch: Contains the built, static website files, deployed to GitHub Pages.

## Setup and Local Development

To set up and run this project locally, ensure you have Ruby, Jekyll, and Bundler installed.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/rohitjain00/rohitjain00.github.io.git
    cd rohitjain00.github.io
    ```

2.  **Install dependencies:**
    ```bash
    bundle install
    ```

3.  **Run the website locally:**
    ```bash
    bundle exec jekyll serve
    ```
    This will serve the website at `http://localhost:4000` (or another port if 4000 is in use).

## Building the Website

The website can be built using the provided build script:

```bash
bash scripts/build.sh
```
This command compiles the Jekyll site into the `_site` directory.

## Pre-commit Hook for Deployment

This repository includes a pre-commit hook that automates the deployment process to GitHub Pages.

-   When you commit changes to the `site` branch, the hook will automatically:
    1.  Build the Jekyll website.
    2.  Switch to the `master` branch.
    3.  Copy the built website files from the `_site` directory to the root of the `master` branch.
    4.  Commit these changes to the `master` branch.
    5.  Switch back to the `site` branch.

**Important:** After committing to the `site` branch, you must manually push both the `site` and `master` branches to your remote repository for the changes to be live on GitHub Pages.

```bash
git push origin site master
```

## Theme Information

This website uses the `dev-portfolio-blog` Jekyll theme. You can find more information about the theme at:

[https://github.com/rohitjain00/dev-portfolio-blog](https://github.com/rohitjain00/dev-portfolio-blog)
