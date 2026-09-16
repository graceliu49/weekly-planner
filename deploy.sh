#!/bin/zsh
# Push the current planner to the phone site. Run from anywhere: ~/Desktop/weekly-planner-site/deploy.sh
set -e
cd "$(dirname "$0")"
cp ~/Desktop/weekly-planner.html index.html
git add -A
git commit -q -m "deploy $(date '+%Y-%m-%d %H:%M')" || true
git pull -q --rebase origin main   # the app commits data.json through the API; fold those in
git push -q
echo "deployed → https://graceliu49.github.io/weekly-planner/"
