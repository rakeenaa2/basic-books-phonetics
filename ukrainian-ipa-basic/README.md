# Ukrainian IPA Children's Book & Parents' Guide (`Українська абетка`)

A version-controlled, data-driven **Children's Sound Book + Parents' Articulatory Phonetics Guide** combo built with [Typst](https://typst.app/). Both books load from a single shared JSON dataset (`data/ukrainian-letters.json`) and give primary visual and pedagogical weight to **International Phonetic Alphabet (IPA)** pronunciation.

> **Current Pilot Scope:** This pilot edition focuses on the compound postalveolar fricative + affricate consonant **`Щ` (`/ʃt͡ʃ/`)** and its showcase word **`щука` (`/ʃt͡ʃuka/`, "Pike (Fish)")**, alongside the visual IPA sound key, parent crash course, and Ukrainian coronal sibilant & affricate articulatory matrix.

---

## Directory Structure

```text
ukrainian-ipa-basic/
├── README.md                      # Build & customization instructions
├── data/
│   └── ukrainian-letters.json     # Single source of truth for IPA, sound recipes, and coaching notes
├── shared/
│   └── theme.typ                  # Color palette, font stacks, and reusable IPA badge components
├── childrens-book.typ             # Landscape A5 colorful picture + giant IPA sound book for kids
└── parents-guide.typ              # Portrait A4 articulatory phonetics & coaching companion for parents
```

---

## Compiling the Books to PDF

### 1. Install Typst
```bash
# macOS (Homebrew)
brew install typst
```

### 2. Recommended Fonts (Optional)
Typst automatically uses macOS system fonts (`Avenir Next`, `Helvetica Neue`, `Lucida Grande`, `Arial Unicode MS`), or you can install:
- **Cyrillic & Body:** `Noto Sans` or `Andika`
- **IPA Diacritics (`t͡ʃ`):** `Charis SIL` or `Gentium Plus`

### 3. Build Both Books
Run from the `ukrainian-ipa-basic/` directory:
```bash
typst compile childrens-book.typ ukrainian-ipa-childrens-book.pdf
typst compile parents-guide.typ ukrainian-ipa-parents-guide.pdf
```

For live-reload preview while editing colors or text:
```bash
typst watch childrens-book.typ
typst watch parents-guide.typ
```

---

## Customizing Colors & Phonetic Data

- **Colors & Badges (`shared/theme.typ`):** Edit the `#let palette = (...)` dictionary to adjust category fills (`vowel-bg`, `cons-bg`, `spec-bg`) or phonetic feature highlights (`ipa-base` for opening fricative `ʃ`, `ipa-puff` for tied affricate release `t͡ʃ`, `ipa-dental` for unaspirated stop `k`).
- **Phonetic Data (`data/ukrainian-letters.json`):** Add or update letter entries in the `letters` array. Both `childrens-book.typ` and `parents-guide.typ` read directly from this JSON file.
