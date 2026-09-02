#!/usr/bin/env bash
# Warn on skill prose paragraphs that exceed the CLAUDE.md per-item length rule
# (see "Token budgets" > per-item length rule). A skill's rendered body is a
# recurring cost paid on every later turn, so density is checked per paragraph,
# not just per file.
#
# Usage:
#   ./scripts/check-prose-density.sh [--quiet] [path ...]
#
# Defaults to scanning skills/ when no path is given. Exits 1 if any paragraph
# is flagged, so it can drive a fix-and-rerun loop; exits 0 when clean.

set -euo pipefail

quiet=0
paths=()
for arg in "$@"; do
  case "$arg" in
    --quiet) quiet=1 ;;
    *) paths+=("$arg") ;;
  esac
done

if [ "${#paths[@]}" -eq 0 ]; then
  paths=("skills")
fi

# Collect target .md files, skipping evals/ (eval fixtures aren't loaded as
# skill body content, so they're exempt from the recurring-context budget).
files=()
for p in "${paths[@]}"; do
  if [ -d "$p" ]; then
    while IFS= read -r f; do
      files+=("$f")
    done < <(find "$p" -name '*.md' -not -path '*/evals/*' | sort)
  elif [ -f "$p" ]; then
    files+=("$p")
  fi
done

if [ "${#files[@]}" -eq 0 ]; then
  echo "No markdown files found under: ${paths[*]}" >&2
  exit 0
fi

total=0
for f in "${files[@]}"; do
  # SENT_CAP=3: the CLAUDE.md per-item rule — a paragraph longer than 3
  #   sentences is two items, or belongs in a bullet list / table.
  # WORD_FLOOR=50: below this, a multi-sentence paragraph reads as
  #   deliberate staccato style rather than density, so it's exempt.
  out=$(awk -v fname="$f" -v quiet="$quiet" '
    BEGIN { infm = 0; incode = 0; nb = 0; SENT_CAP = 3; WORD_FLOOR = 50 }
    FNR == 1 { infm = 0; incode = 0; nb = 0 }
    FNR == 1 && $0 == "---" { infm = 1; next }
    infm && $0 == "---" { infm = 0; next }
    infm { next }
    /^[ \t]*(```|~~~)/ { incode = !incode; flush(); next }
    incode { next }
    /^[ \t]*$/ { flush(); next }
    {
      if (nb == 0) start = FNR
      buf[nb++] = $0
      next
    }
    END { flush() }
    function flush(   i, t, w, c, n, tt, W, preview) {
      if (nb == 0) return
      t = ""
      for (i = 0; i < nb; i++) t = t buf[i] " "
      nb = 0
      # Skip headings, list items, table rows, blockquotes, raw HTML —
      # these are structured content, not prose paragraphs.
      if (t ~ /^[ \t]*(#|[-*+] |[0-9]+[.)] |\||>|<)/) return
      # Neutralize tokens that would inflate sentence/word counts:
      # inline code, links, decimal numbers, and common abbreviations.
      gsub(/`[^`]*`/, "CODE", t)
      gsub(/\[([^]]*)\]\([^)]*\)/, "LINK", t)
      gsub(/([0-9])[.,]([0-9])/, "\\1\\2", t)
      gsub(/e\.g\.|i\.e\.|etc\.|vs\./, "ABBR", t)
      n = split(t, W, /[ \t]+/)
      w = 0
      for (i = 1; i <= n; i++) if (W[i] != "") w++
      tt = t
      c = gsub(/[.!?]["'"'"')]*[ \t]+["'"'"'(*_]*[A-Z0-9]/, "&", tt)
      if (t ~ /[.!?]["'"'"')]*[ \t]*$/) c++
      if (c > SENT_CAP && w >= WORD_FLOOR) {
        preview = substr(t, 1, 80)
        if (!quiet) printf "%s:%d  (%d sentences, %d words)  %s...\n", fname, start, c, w, preview
        print "HIT" > "/dev/stderr"
      }
    }
  ' "$f" 2>/tmp/prose_density_hit.$$)
  [ -n "$out" ] && printf '%s\n' "$out"
  if [ -s /tmp/prose_density_hit.$$ ]; then
    n=$(wc -l < /tmp/prose_density_hit.$$)
    total=$((total + n))
  fi
  rm -f /tmp/prose_density_hit.$$
done

echo "TOTAL: $total flagged paragraph(s) in ${#files[@]} file(s)"
[ "$total" -gt 0 ] && exit 1
exit 0
