# Tingjun Huang

An English-language academic homepage focused on embodied AI, 3D vision and robotics. Built with Jekyll and published at [tangenth.github.io](https://tangenth.github.io/).

## Add an entry

A title and a few sentences are enough. Create a Markdown file in `_projects/` for a project or `_experience/` for an experience, using this complete format:

```markdown
---
title: "Your project title"
---

Describe your work in a few sentences.
```

On GitHub, open the folder, choose **Add file > Create new file**, and use a filename such as `my-project.md`. Paste the format above, replace the title and text, then commit. GitHub Pages rebuilds the homepage automatically. You can also copy `templates/project.md` or `templates/experience.md`.

That is all the required content. Keep the title in double quotes and write the description below the second `---`. The description is ordinary Markdown: paragraphs, lists, links and images work without HTML. Use **Preview** in GitHub to check the Markdown. The published page supplies the headings, spacing and layout.

New entries without an `order` appear before entries with an explicit order, sorted by filename. All projects appear in **Research & projects**; no category or group field is needed.

## Edit existing content

| What to change | File or folder |
| --- | --- |
| Name, affiliation, email, profile links, portrait and CV link | `_data/profile.yml` |
| Short biography | `_pages/about.md` |
| Research and projects | `_projects/` - one Markdown file per project |
| Research and engineering experience | `_experience/` - one Markdown file per entry |
| Education | `_data/education.yml` |
| Additional information: skills, selected honors and interests | `_includes/more.md` |
| Project and experience images | `images/projects/` |
| Publications | `_publications/` - one Markdown file per paper |
| Downloadable CV | `assets/files/Tingjun-Huang-CV.pdf` |

## Optional details

Add any of these lines between the two `---` lines only when useful. You can omit every field in this table.

| Field | Purpose |
| --- | --- |
| `period: "2026"` | Display a date or date range. |
| `context: "Research project at ETH Zurich"` | Display a role, institution or other short context. |
| `order: 10` | Place an entry among explicitly ordered entries; smaller numbers appear first. Repeated numbers are allowed. |
| `visible: false` | Hide the entry from the homepage. Entries are visible by default. |
| `image: /images/projects/filename.png` | Attach an uploaded image using the site's consistent entry layout. |
| `image_alt: "What the image shows"` | Supply a specific image description. If omitted, the entry title is used. |
| `authors: "Author names"` | Display the confirmed authors of a publication. |
| `links` | Display a list of labeled links after the description; ordinary Markdown links in the description are equally supported. |

For a simple link, write it directly in the description. For example, `[CV](/assets/files/Tingjun-Huang-CV.pdf)` links to the existing CV. You do not need a `links` field. If you prefer separate link labels, use the existing entries as examples of the optional `links` list.

For an image, upload the file to `images/projects/` first. Add its `/images/projects/filename.png` path as `image`, or insert an ordinary Markdown image in the description. With the optional `image` field, the entry's title, date and context appear above the content; the image sits to the right of the description on wider screens and below it on small screens. A descriptive `image_alt` is helpful but not required; existing descriptions should be retained.

Hidden source files remain readable in this public repository. Keep confidential drafts elsewhere. Omit links until they are public and working.

### Add a publication

Copy `templates/publication.md` into `_publications/`, then replace its title and paragraph. Authors, year, venue and links are optional; add them when confirmed. The Publications section appears only when there is a visible entry. Record the actual status accurately; a research project does not automatically become a publication.

### Replace the CV or photo

Upload a new PDF as `assets/files/Tingjun-Huang-CV.pdf`, replacing the existing file. The profile link then keeps working without further edits. To use a different filename, update `_data/profile.yml`.

Replace `images/tj_profile.jpg`, or set `photo` to a new image path and update `photo_alt`. The page automatically displays the portrait with a circular crop. Upload a regular image; no manual cropping is needed.

## Preview and check locally

Routine content edits can be made entirely in GitHub. For a local preview, install Ruby and Bundler, then run:

```sh
bundle install
bundle exec jekyll serve
```

Open the local address printed by Jekyll. Markdown and style edits rebuild automatically. Restart the server after changing `_config.yml`.

Before publishing a larger change:

```sh
ruby scripts/check_content.rb
bundle exec jekyll build
python3 scripts/check_site.py _site
```

The checks report missing titles or descriptions, invalid optional metadata, broken local links, duplicate HTML IDs and missing rendered image descriptions. Missing ordering values, repeated ordering values and omitted image descriptions in metadata are allowed. The workflow runs these checks on pushes and pull requests; GitHub Pages handles deployment separately. External links may require manual checking because some sites block automated requests.

## Repository structure

`_layouts/home.html` defines the page and `_includes/entry.html` renders entries consistently. `assets/css/site.css` contains the responsive styling. The page uses system fonts and works without JavaScript. `templates/` and maintenance files are excluded from the generated website.

All site content, comments, templates and maintenance documentation are in English. Keep additions in English as well. The active site is a small custom Jekyll implementation; unused AcadHomepage theme files, scripts, fonts and crawler resources have been removed. Earlier versions remain recoverable in Git history, and the inherited MIT license is retained.

`images/projects/lisn-social-navigation.jpg` is adapted from the [LISN project page](https://social-nav.github.io/LISN-project/), whose website is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

See [deployment details](DEPLOYMENT_GUIDE.md), [editing conventions](CONTRIBUTING.md) and [common editing issues](QUICK_FIX.md).
