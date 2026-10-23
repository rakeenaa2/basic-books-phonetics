# Nepali IPA Children's Book & Parents' Guide (`नेपाली वर्णमाला`)

A version-controlled, data-driven **Children's Sound Book + Parents' Articulatory Phonetics Guide** combo built with [Typst](https://typst.app/). Both books load from a single shared JSON dataset (`data/nepali-letters.json`) and give primary visual and pedagogical weight to **International Phonetic Alphabet (IPA)** pronunciation.

> **Current Pilot Scope:** This pilot edition focuses on the aspirated denti-alveolar affricate **`छ` (`/t͡sʰ/`)** and its showcase word **`छाता` (`/t͡sʰat̪a/`, "Umbrella")**, alongside the visual IPA sound key, parent crash course, and 5×5 articulatory consonant matrix.

---

## Directory Structure

```text
nepali-ipa-basic/
├── README.md                    # Build & customization instructions
├── data/
│   └── nepali-letters.json      # Single source of truth for IPA, sound recipes, and coaching notes
├── shared/
│   └── theme.typ                # Color palette, Devanagari font stacks, and reusable IPA badge components
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

### 2. Recommended Fonts (Optional)
Typst automatically falls back to macOS system fonts (`Kohinoor Devanagari`, `Devanagari Sangam MN`, `Helvetica Neue`, `Lucida Grande`, `Arial Unicode MS`), or you can install:
- **Devanagari Script:** `Noto Sans Devanagari` or `Baloo 2`
- **IPA & Body:** `Charis SIL`, `Andika`, or `Noto Sans`

### 3. Build Both Books
Run from the `nepali-ipa-basic/` directory:
```bash
typst compile childrens-book.typ nepali-ipa-childrens-book-pilot.pdf
typst compile parents-guide.typ nepali-ipa-parents-guide-pilot.pdf
```

For live-reload preview while editing colors or text:
```bash
typst watch childrens-book.typ
typst watch parents-guide.typ
```

---

## Customizing Colors & Phonetic Data

- **Colors & Badges (`shared/theme.typ`):** Edit the `#let palette = (...)` dictionary to adjust category fills (`vowel-bg`, `cons-bg`, `spec-bg`) or phonetic feature highlights (`ipa-base` for denti-alveolar affricate `t͡s`, `ipa-puff` for aspiration `ʰ`, `ipa-dental` for dental `t̪`).
- **Phonetic Data (`data/nepali-letters.json`):** Add or update letter entries in the `letters` array. Both `childrens-book.typ` and `parents-guide.typ` read directly from this JSON file.
