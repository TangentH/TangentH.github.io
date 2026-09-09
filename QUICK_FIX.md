# Common editing issues

- **I only have a title and a few sentences:** that is enough. Copy a template from `templates/` into `_projects/` or `_experience/`, replace its title and paragraph, and commit. No date, image, links or order are required.
- **A project does not appear:** check that its filename ends in `.md`, it is in `_projects/`, it has a nonempty title between `---` lines and text below, and it does not have `visible: false`.
- **A title containing a colon breaks the build:** quote the complete title, for example `title: "Project: A clear subtitle"`. For quotation marks inside a title, escape them as `\"`.
- **An entry appears in an unexpected position:** entries without `order` appear first, sorted by filename. To choose a position among explicitly ordered entries, add an integer such as `order: 10`; lower numbers appear first. Repeated numbers are allowed.
- **I want to add a link or image:** ordinary Markdown links and images work in the description. For the site's standard image placement, upload an image and add its path as `image` in the metadata. `image_alt` is optional and defaults to the title.
- **An image or CV does not open:** use a path beginning with `/` for repository files and check spelling and letter case. Upload the file before linking to it.
- **The biography appears twice:** keep the homepage only in `_pages/about.md`; do not add another `index.html` with `permalink: /`.
- **The Publications section is missing:** this is expected when `_publications/` has no visible entries.
- **The local configuration seems stale:** restart Jekyll after changing `_config.yml`.
- **The live website is older than the repository:** inspect the Pages deployment status in Actions, then reload after it succeeds.
