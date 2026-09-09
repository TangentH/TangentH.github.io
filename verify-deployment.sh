#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
ruby scripts/check_content.rb
bundle exec jekyll build
python3 scripts/check_site.py _site
