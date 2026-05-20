# Audit Tools

For AUDIT mode and for Phase 3 corpus diagnosis. The goal: compute objective prose metrics on a corpus so that the prose guide's targets are empirical, not invented.

These tools do not produce prose recommendations directly. They surface signals; the model interprets them and codifies the rules.

## Readability

### Hemingway Editor

Browser tool at hemingwayapp.com (or the desktop / pasteable web version). Highlights:

- Sentences hard to read (yellow) and very hard (red)
- Passive voice
- Adverbs
- Complex phrases ("utilize" → "use")
- Reading grade level

**Usage**: paste 1000 words. Read off the grade level. Targets per category:

| Category             | Target grade |
| -------------------- | ------------ |
| B2C / consumer brand | 6–9          |
| B2B SaaS             | 9–12         |
| NGO / nonprofit      | 7–10         |
| Industry / deep-tech | 12–16        |
| Consulting           | 11–14        |

**Why grade level matters**: it correlates with sentence length, syllable count, and Latinate ratio. A grade level mismatched with audience expertise predicts drop-off.

### Plain Language Commission

For UK English specifically. Maps to the same metrics with slightly different targets.

## Banned-word enforcement

### Vale

Vale (vale.sh) is the dominant prose linter. It applies YAML rules to Markdown / plain text and flags violations.

Sample Vale rule (banned word):

```yaml
extends: existence
message: "Banned word: '%s'. Use a plain alternative."
level: error
tokens:
  - delve
  - leverage
  - crucial
  - robust
  - underscore
  - seamlessly
  - navigate
  - harness
  - foster
  - embark
  - myriad
  - tapestry
  - paradigm
  - utilize
  - facilitate
  - commence
```

Place under `.vale/styles/Brand/BannedWords.yml`. The brand can extend with category-specific bans (e.g., "synergize" for consulting).

**Why Vale, not LanguageTool, for banned words**: Vale is built for prose-rule enforcement; LanguageTool is built for grammar correction. Different tools, different jobs.

### LanguageTool

LanguageTool (languagetool.org or the open-source self-host) catches grammar errors, typos, and weak constructions. Strong on:

- Subject-verb agreement
- Passive voice (alerts; does not auto-rewrite)
- Wordiness suggestions
- Repeated words

**Configuration**: import the brand's banned-word list as a custom dictionary; whitelist intentional brand terms (the lowercase Innocent, the all-caps Apple SHORTCUTS, etc.).

### Grammarly Business

Same job class as LanguageTool, commercial. Stronger UI for distributed writers. Custom dictionary supports the brand's banned and required terms. Browser plugin enforces in-flow.

## Quantitative metrics

### Mean sentence length and distribution

A short Python snippet for a quick audit:

```python
import sys
import re
from statistics import mean, stdev

text = sys.stdin.read()
# Split on sentence terminators, ignoring abbreviations
sentences = re.split(r'(?<=[.!?])\s+', text)
sentences = [s.strip() for s in sentences if s.strip()]
lengths = [len(s.split()) for s in sentences]

print(f"Sentences: {len(sentences)}")
print(f"Mean length: {mean(lengths):.1f} words")
print(f"Std dev: {stdev(lengths):.1f}")
print(f"Min / max: {min(lengths)} / {max(lengths)}")
print(f"≥ 25 words: {sum(1 for l in lengths if l >= 25)} ({100*sum(1 for l in lengths if l >= 25)/len(lengths):.1f}%)")
print(f"≤ 8 words: {sum(1 for l in lengths if l <= 8)} ({100*sum(1 for l in lengths if l <= 8)/len(lengths):.1f}%)")
```

Run on each piece in the corpus. Aggregate per channel.

### Type-token ratio

Vocabulary diversity. Lower TTR = more repetition (often a sign of LLM-flat lexicon). Compute as `unique_words / total_words` on a 1000-word window. Healthy human B2B prose lands at 0.40–0.55; LLM-default sits at 0.30–0.42 due to favored vocabulary clustering.

### n-gram frequency

For lexical drift detection. Compare two corpora (e.g., pre-AI vs post-AI):

```python
from collections import Counter

def ngrams(text, n=3):
    tokens = text.lower().split()
    return Counter(' '.join(tokens[i:i+n]) for i in range(len(tokens) - n + 1))

pre = ngrams(open('pre_ai_corpus.txt').read())
post = ngrams(open('post_ai_corpus.txt').read())

# Trigrams that surged
diff = [(t, post[t] - pre[t]) for t in post]
diff.sort(key=lambda x: -x[1])
for t, d in diff[:30]:
    print(f"{d:+5d}  {t}")
```

Top surging trigrams flag the brand's drift vectors.

### Banned-word frequency

```bash
# Count banned-word hits across a corpus
grep -roEic 'delve|leverage|crucial|robust|underscore|seamlessly|navigate|harness|foster|embark|myriad|tapestry|holistic|paradigm|utilize|facilitate|commence' ./corpus/ | sort -t: -k2 -nr
```

Hits per 500 words is the relevant rate.

## Reading-aloud audit

The lowest-tech tool, often the most revealing. Read the piece aloud:

1. Mark every breath point.
2. Mark every sentence where you stumble or have to re-read.
3. Mark every monotonous stretch (more than 4 consecutive medium sentences).
4. Mark every accidental rhyme or alliteration.

A trained editor catches in 5 minutes what statistical tools miss. Codify the read-aloud audit as part of the per-piece QA checklist for high-stakes content (pillars, executive op-eds, keynotes).

## n-gram comparison for ghostwriting

For ghostwriting voice-matching audits: compute n-gram overlap between the principal's authentic writing/speech corpus and the ghostwriter's drafts. Low overlap on signature n-grams = the ghostwriter has flattened the principal's idiolect.

This is the operational test for the "thinking translation problem" — when the ghostwriter reproduces the client's sentence structure and vocabulary but misses the actual operational insight only the client could have.

## Web-based readability tests

For a quick sanity check without local tooling:

- **Hemingway Editor** (hemingwayapp.com) — grade level, complex sentences, passive voice, adverbs
- **Datayze Sentence Length Checker** (datayze.com/sentence-length-checker) — distribution histogram
- **WebFX Readability Test** (webfx.com/tools/read-able) — multiple readability scores

## Vale + CI integration

For content factories at scale, wire Vale into the editorial CI:

```ini
# .vale.ini
StylesPath = .vale/styles
MinAlertLevel = warning

[*.md]
BasedOnStyles = Brand, Microsoft, write-good
```

Run on every pull request to the content repo. Fail the build on Vale errors. **Why**: the prose guide is enforced by tooling, not by editor fatigue. Editors should review judgment calls, not catch banned words.

## Limits of automation

These tools surface signals; none replaces editorial judgment. A piece can pass every quantitative check and still read flat — because the voice markers are missing, or the structure is wrong, or the hook doesn't earn the close. Use audit tools as the first filter, then ship to human editorial review for the rest.
