# Bengali IPA Children's Book & Parents' Guide (`বাংলা বর্ণমালা`)

A version-controlled, data-driven **Children's Sound Book + Parents' Articulatory Phonetics Guide** combo built with [Typst](https://typst.app/). Both books load from a single shared JSON dataset (`data/bengali-letters.json`) and give primary visual and pedagogical weight to **International Phonetic Alphabet (IPA)** pronunciation.

> **Current Pilot Scope:** This pilot edition focuses on the aspirated post-alveolar affricate **`ছ` (`/t͡ʃʰ/`)** and its showcase word **`ছাতা` (`/t͡ʃʰat̪a/`, "Umbrella")**, alongside the visual IPA sound key, parent crash course, and 5×5 articulatory consonant matrix.

---

## Directory Structure

```text
bengali-ipa-basic/
├── README.md                    # Build & customization instructions
├── data/
│   └── bengali-letters.json     # Single source of truth for IPA, sound recipes, and coaching notes
├── shared/
│   └── theme.typ                # Color palette, font stacks, and reusable IPA badge components
├── childrens-book.typ           # Landscape A5 colorful picture + giant IPA sound book for kids
└── parents-guide.typ            # Portrait A4 articulatory phonetics & coaching companion for parents
```

---

## Compiling the Books to PDF

### 1. Install Typst
```bash
# macOS (Homebrew)
brew install typst
```

### 2. Recommended Fonts (Optional but Recommended)
Typst automatically falls back to system fonts (`Kohinoor Bangla`, `Bangla Sangam MN`, `Helvetica Neue`), but for optimal Bengali conjuncts and IPA diacritics (`t͡ʃʰ`, `t̪`), install:
- **Bengali Script:** `Baloo Da 2` or `Noto Sans Bengali`
- **IPA & Body:** `Charis SIL`, `Andika`, or `Noto Sans`

### 3. Build Both Books
Run from the `bengali-ipa-basic/` directory:
```bash
typst compile childrens-book.typ bengali-ipa-childrens-book.pdf
typst compile parents-guide.typ bengali-ipa-parents-guide.pdf
```

For live-reload preview while editing colors or text:
```bash
typst watch childrens-book.typ
typst watch parents-guide.typ
```

---

## Customizing Colors & Phonetic Data

- **Colors & Badges (`shared/theme.typ`):** Edit the `#let palette = (...)` dictionary to adjust category fills (`vowel-bg`, `cons-bg`, `spec-bg`) or phonetic feature highlights (`ipa-base` for tongue articulation, `ipa-puff` for aspiration `ʰ`, `ipa-dental` for dental `t̪`).
- **Phonetic Data (`data/bengali-letters.json`):** Add or update letter entries in the `letters` array. Both `childrens-book.typ` and `parents-guide.typ` read directly from this JSON file.
