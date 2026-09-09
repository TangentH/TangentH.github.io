# GitHub Pages deployment

This repository keeps the existing Jekyll / GitHub Pages setup. The homepage is `_pages/about.md` with `permalink: /`; there is no competing root index page.

## Normal updates

Edit the content files described in the README and commit to `main`. GitHub Pages builds the site from the configured branch. Check **Actions > pages build and deployment** for the deployment result and **Settings > Pages** for the public URL.

The separate **Validate content** workflow checks metadata and the generated HTML on pushes and pull requests. It does not change the Pages source setting.

## Setup or recovery

1. In **Settings > Pages**, use **Deploy from a branch**, branch **main**, folder **/(root)**.
2. Keep `url: https://tangenth.github.io` and `baseurl: ""` in `_config.yml` for this user site.
3. Check the build log if the site does not update. YAML indentation and unquoted colons in titles are common mistakes.
4. Allow the deployment to finish before checking the public page. A completed repository commit alone does not establish that the page has deployed.

To restore a prior design, revert its commit or restore selected files from Git history. Do not force-push or delete the repository.

Official reference: [GitHub Pages with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll).
