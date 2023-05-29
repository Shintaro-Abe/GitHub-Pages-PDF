#!/bin/sh
Site_Repository=https://github.com/Shintaro-Abe/test
Site_Shields=https://img.shields.io/badge
npx md-to-pdf docs/README.md --config-file ./pdf-configs/config.js
git add docs
git push

Commit_ID=$(git show --format='%H' --no-patch)
gsed -i "/alt=\"PDF\"/c \
\      <td align=\"left\"><a href=\"$Site_Repository/blob/$Commit_ID/docs/README.pdf\"><img alt=\"PDF\" src=\"$Site_Shields/View-PDF-red.svg?style=flat-square\"></a> \
\<a href=\"$Site_Repository/raw/$Commit_ID/docs/README.pdf\"><img src=\"$Site_Shields/Download-PDF-red.svg?style=flat-square\"></a></td>" \
README.md
git add README.md
git commit -m 'Fixing links'
git push