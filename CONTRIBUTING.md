# Editing conventions

To add a project or experience, create one Markdown file in `_projects/` or `_experience/`. Only a quoted title between `---` lines and a few sentences below are required. Copy the corresponding file from `templates/` if convenient. See the [README](README.md#add-an-entry) for the complete minimal example.

- Write all public text, source comments and maintenance documentation in English.
- Start with a short paragraph describing the work and your contribution. Ordinary Markdown links, images, lists and additional paragraphs are supported.
- Dates, context, images, links and ordering are optional. Omit fields you do not need; no group or category is required.
- Entries without an `order` appear first, sorted by filename. Explicit order numbers appear afterward in ascending order; repeated numbers are allowed.
- Add `image` only when using the standard entry image layout. Its description defaults to the entry title. Retain existing specific `image_alt` descriptions, and add one when it helps explain a new image.
- Preserve verified dates, affiliations, role names and award levels. Do not infer a new title or role from a project description.
- Add only public, working links. Distinguish implemented work from future plans, and include quantitative results only with a defensible comparison.
- Keep layout changes in the layout and style files. Routine content additions need no HTML, CSS or template edits.
- Use `visible: false` to hide an entry, remembering that its source remains public.
- Run the checks described in the README before publishing substantial changes.
