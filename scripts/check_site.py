"""Check generated local links, page IDs and image descriptions."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlsplit, unquote
import sys

root = Path(sys.argv[1] if len(sys.argv) > 1 else "_site").resolve()
errors = []
class Page(HTMLParser):
    def __init__(self, path):
        super().__init__(); self.path = path; self.ids = set(); self.links = []
    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if "id" in a:
            if a["id"] in self.ids: errors.append(f"{self.path}: duplicate ID {a['id']}")
            self.ids.add(a["id"])
        if tag == "img" and not a.get("alt", "").strip():
            errors.append(f"{self.path}: image needs a description")
        for key in ("href", "src"):
            if key in a: self.links.append(a[key])

pages = {}
for path in root.rglob("*.html"):
    page = Page(path.relative_to(root)); page.feed(path.read_text()); pages[path] = page
if root / "index.html" not in pages: errors.append("Missing homepage index.html")
for path, page in pages.items():
    for link in page.links:
        u = urlsplit(link)
        if u.scheme or u.netloc: continue
        target = (root / unquote(u.path).lstrip("/")) if u.path.startswith("/") else (path.parent / unquote(u.path))
        if not u.path: target = path
        if target.is_dir(): target /= "index.html"
        target = target.resolve()
        if not target.exists(): errors.append(f"{page.path}: missing local target {link}")
        elif u.fragment and target in pages and unquote(u.fragment) not in pages[target].ids:
            errors.append(f"{page.path}: missing fragment {link}")
if errors: raise SystemExit("\n".join(errors))
print(f"Checked {len(pages)} HTML pages: local links, IDs and image descriptions passed.")
