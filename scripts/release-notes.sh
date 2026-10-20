#!/usr/bin/env bash
# Affiche la section du CHANGELOG correspondant à une version (sans son titre).
# Usage : scripts/release-notes.sh X.Y.Z [CHANGELOG.md]
# Échoue si la section est absente ou vide, afin de ne pas publier une release sans notes.
set -euo pipefail

version="${1:?Usage: $0 X.Y.Z [CHANGELOG.md]}"
changelog="${2:-CHANGELOG.md}"

notes="$(awk -v version="$version" '
  /^## \[/ {
    if (found) exit
    if (index($0, "## [" version "]") == 1) { found = 1; next }
  }
  found { print }
' "$changelog")"

if [[ -z "${notes//[[:space:]]/}" ]]; then
  echo "Aucune note de version trouvée pour $version dans $changelog" >&2
  exit 1
fi

printf '%s\n' "$notes"
