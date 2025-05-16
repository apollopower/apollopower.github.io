#!/bin/bash

DATE=$(date +"%Y-%m-%d")
TITLE=$(date +"%B %d, %Y")
FILENAME="_plans/$DATE.md"

# Fallback editor
: "${EDITOR:=vim}"

# Create a temp file with a template
TMPFILE=$(mktemp /tmp/plan.XXXXXX.md)

cat <<EOF > "$TMPFILE"
---
title: "$TITLE"
date: $DATE
layout: default
---

💭 **Top Thoughts**

Your thoughts here...

✅ **Recently Done**

- 

🛠️ **Work Focus**

- 

🚴🏻‍♂️ **Training**

- 
EOF

# Open in user's preferred editor
"$EDITOR" "$TMPFILE"

# Confirm save
echo
read -p "Save .plan entry to $FILENAME and commit? (y/n): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  mv "$TMPFILE" "$FILENAME"
  git add "$FILENAME"
  git commit -m ".plan update for $DATE"
  git push origin main
  echo "✅ .plan for $DATE saved and pushed!"
else
  rm "$TMPFILE"
  echo "🛑 Aborted. Temporary file deleted."
fi
