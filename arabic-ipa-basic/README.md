# Arabic IPA Children's Book & Parents' Guide (`الأبجدية العربية`)

A version-controlled, data-driven **Children's Sound Book + Parents' Articulatory Phonetics Guide** combo built with [Typst](https://typst.app/). Both books load from a single shared JSON dataset (`data/arabic-letters.json`) and give primary visual and pedagogical weight to **International Phonetic Alphabet (IPA)** pronunciation.

> **Current Pilot Scope:** This pilot edition focuses on the voiceless pharyngealized (emphatic) denti-alveolar sibilant **`ص` (`/sˤ/`)** and its showcase word **`صُورَة` (`/sˤuːra/`, "Picture")**, alongside the visual IPA sound key, parent crash course, and Arabic plain vs. emphatic (*mufakhkham*) coronal articulatory matrix.

---

## Directory Structure

```text
arabic-ipa-basic/
├── README.md                    # Build & customization instructions
├── data/
│   └── arabic-letters.json      # Single source of truth for IPA, sound recipes, and coaching notes
├── shared/
│   └── theme.typ                # Color palette, RTL font stacks, and reusable IPA badge components
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
Typst automatically uses macOS system fonts (`Geeza Pro`, `Damascus`, `Avenir Next`, `Helvetica Neue`, `Lucida Grande`, `Arial Unicode MS`), or you can install:
- **Arabic Script:** `Amiri` or `Noto Naskh Arabic`
- **IPA Diacritics (`ˤ`):** `Charis SIL` or `Gentium Plus`

### 3. Build Both Books
Run from the `arabic-ipa-basic/` directory:
```bash
typst compile childrens-book.typ arabic-ipa-childrens-book.pdf
typst compile parents-guide.typ arabic-ipa-parents-guide.pdf
```

For live-reload preview while editing colors or text:
```bash
typst watch childrens-book.typ
typst watch parents-guide.typ
```

---

## Customizing Colors & Phonetic Data

- **Colors & Badges (`shared/theme.typ`):** Edit the `#let palette = (...)` dictionary to adjust category fills (`vowel-bg`, `cons-bg`, `spec-bg`) or phonetic feature highlights (`ipa-base` for front sibilant `s`, `ipa-puff` for pharyngealization modifier `ˤ`, `ipa-dental` for alveolar tap/trill `r`).
- **Phonetic Data (`data/arabic-letters.json`):** Add or update letter entries in the `letters` array. Both `childrens-book.typ` and `parents-guide.typ` read directly from this JSON file.
