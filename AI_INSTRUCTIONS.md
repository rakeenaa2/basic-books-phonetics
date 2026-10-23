# AI Instructions — Basic Books Phonetics

## 1. Project Identity & Scope

- **Owner:** Fun In Phonetics LLC (`Proprietary License — All Rights Reserved`).
- **Repository Purpose:** This repository (`basic-books-phonetics`) contains **Typst-based printable book sets**—specifically paired **Children's IPA Sound Books** (`childrens-book.typ`) and **Parents' Articulatory Phonetics & Coaching Guides** (`parents-guide.typ`).
- **Strict Separation:** Keep this repository completely separate from the interactive HTML project (`phonetics-of-languages`). Do not add browser/HTML guide files here, and do not reference external directories outside this workspace.

---

## 2. Repository Structure

Each language book set lives in its own `<language>-ipa-basic/` directory:

```text
basic-books-phonetics/
├── AI_INSTRUCTIONS.md
├── .cursorrules
├── .rules/
│   ├── arabic.md                    # Arabic contrastive phonetic phenomena
│   ├── bengali.md                   # Bengali contrastive phonetic phenomena
│   └── ukrainian.md                 # Ukrainian contrastive phonetic phenomena
├── LICENSE
├── README.md
└── <language>-ipa-basic/
    ├── README.md                    # Build & customization instructions
    ├── childrens-book.typ           # Landscape A5 children's visual IPA sound book
    ├── parents-guide.typ            # Portrait A4 parents' articulatory phonetics manual
    ├── data/
    │   └── <language>-letters.json  # Single source of truth for graphemes, IPA, and coaching
    └── shared/
        └── theme.typ                # Color palette, font stacks, and reusable Typst components
```

---

## 3. Data-Driven Architecture (Single Source of Truth)

- **No Hardcoded Linguistic Content in Templates:** All letters, IPA transcriptions, sound recipes, word breakdowns, articulatory steps, tactile coaching games, and common pitfalls must reside in `data/<language>-letters.json`.
- **Dual-Book Parity:** Both `childrens-book.typ` and `parents-guide.typ` must read from the same `data/<language>-letters.json` file so that phonetic transcriptions and example vocabulary never drift between the child and parent editions.
- **Required JSON Schema per Letter Entry (`letters[]`):**
  - `id`, `letter`, `category`, `category_label_bn` (or native script), `category_label_en`
  - `ipa`, `ipa_base`, `ipa_modifier`
  - `word`, `word_ipa`, `word_syllables_ipa`, `gloss`, `emoji`
  - `sound_recipe[]` (`part`, `label`, `detail`)
  - `articulation` (`voicing`, `place`, `manner`, `airflow`)
  - `word_breakdown[]` (`grapheme`, `ipa`, `role`, `note`)
  - `mouth_placement_steps[]`
  - `coaching_game` (`title`, `setup`, `action`, `success_cue`)
  - `common_pitfalls[]` (`issue`, `fix`)

---

## 4. Linguistic & Phonetic Standards

- **IPA First:** Always prioritize exact **International Phonetic Alphabet (IPA)** transcriptions over ad-hoc English romanization.
- **Per-Language Contrastive Phenomena (`.rules/<language>.md`):**
  - Before creating or modifying any `<language>-ipa-basic/` dataset or template, read and enforce its corresponding rule file in `.rules/`:
    - Arabic (`arabic-ipa-basic/`): `.rules/arabic.md`
    - Bengali (`bengali-ipa-basic/`): `.rules/bengali.md`
    - Ukrainian (`ukrainian-ipa-basic/`): `.rules/ukrainian.md`
  - Preserve the contrastive minimal-pair distinctions, native script spellings, and phonemic categories documented in each language's `.rules/<language>.md` file.
- **Unicode Accuracy:**
  - Use proper Unicode combining characters and modifiers for IPA diacritics: tie-bar `t͡ʃ` (`U+0361`), dental bridge `t̪` (`U+032A`), aspiration `ʰ` (`U+02B0`), breathy voice `ʱ` (`U+02B1`), pharyngealization `ˤ` (`U+02E4`), palatalization `ʲ` (`U+02B2`), length mark `ː` (`U+02D0`), nasalization tilde `̃` (`U+0303`), and primary stress `ˈ` (`U+02C8`).
  - Delimit phonemic transcriptions with `/ /` and phonetic realizations with `[ ]`.
- **Feature Color-Coding (`shared/theme.typ`):**
  - `palette.ipa-base`: Base articulation / tongue closure and release.
  - `palette.ipa-puff`: Aspiration burst (`ʰ`) or secondary articulation modifier (`ˤ`, `t͡ʃ`).
  - `palette.ipa-dental`: Dental placement (`̪`) or secondary coronal/stop highlight.

---

## 5. Typst Layout & Build Conventions

- **Children's Book (`childrens-book.typ`):**
  - Paper: `a5`, `flipped: true` (landscape).
  - High visual contrast, neo-brutalist card borders (`neo-card`), large native script glyphs (`bn(...)`), and oversized color-coded IPA hero badges (`ipa-hero-badge(...)`).
- **Parents' Guide (`parents-guide.typ`):**
  - Paper: `a4` (portrait).
  - Structured articulatory matrices, step-by-step vocal tract instructions, phonemic word anatomy tables, and interference/pitfall fixes.
- **Zero-Warning Compilation:**
  - Verify changes by compiling both books with Typst (`typst compile childrens-book.typ` and `typst compile parents-guide.typ`).
  - Do not commit compiled `.pdf` outputs (ignored via `.gitignore`).
