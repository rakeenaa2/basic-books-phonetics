# Basic Books Phonetics

Printable, data-driven **Children's IPA Sound Books** and **Parents' Articulatory Phonetics Guides** built with [Typst](https://typst.app/).

## Overview

This repository hosts source files for paired print books that teach scripts and spoken languages through **International Phonetic Alphabet (IPA)** pronunciation rather than imprecise English romanization. Each language module shares a single JSON phonetic dataset across two companion books:

- **Children's Sound Book (`childrens-book.typ`):** Landscape A5 visual book featuring native script graphemes, color-coded IPA badges, mouth cues, and example vocabulary.
- **Parents' Coaching Guide (`parents-guide.typ`):** Portrait A4 articulatory phonetics reference and coaching manual for parents and educators.

## Features

- **Single Source of Truth:** Shared JSON datasets (`data/<language>-letters.json`) drive both the children's book and parents' guide.
- **Color-Coded IPA System:** Visual differentiation of base articulation, aspiration (`ʰ`), dental placement (`̪`), and vowel quality (`shared/theme.typ`).
- **Articulatory Coaching:** Step-by-step vocal tract instructions, English-trap warnings, and phonetic matrices for parents.
- **Reproducible Print Layout:** Typeset directly to print-ready PDF using Typst.

## Repository Structure

```text
basic-books-phonetics/
└── <language>-ipa-basic/
    ├── README.md
    ├── childrens-book.typ
    ├── parents-guide.typ
    ├── data/
    │   └── <language>-letters.json
    └── shared/
        └── theme.typ
```

| Directory | Language / Script | Books |
| :--- | :--- | :--- |
| [`arabic-ipa-basic/`](./arabic-ipa-basic/) | Arabic (العربية) | [`childrens-book.typ`](./arabic-ipa-basic/childrens-book.typ) · [`parents-guide.typ`](./arabic-ipa-basic/parents-guide.typ) |
| [`bengali-ipa-basic/`](./bengali-ipa-basic/) | Bengali (বাংলা) | [`childrens-book.typ`](./bengali-ipa-basic/childrens-book.typ) · [`parents-guide.typ`](./bengali-ipa-basic/parents-guide.typ) |
| [`nepali-ipa-basic/`](./nepali-ipa-basic/) | Nepali (नेपाली) | [`childrens-book.typ`](./nepali-ipa-basic/childrens-book.typ) · [`parents-guide.typ`](./nepali-ipa-basic/parents-guide.typ) |
| [`ukrainian-ipa-basic/`](./ukrainian-ipa-basic/) | Ukrainian (Українська) | [`childrens-book.typ`](./ukrainian-ipa-basic/childrens-book.typ) · [`parents-guide.typ`](./ukrainian-ipa-basic/parents-guide.typ) |

## Building PDFs

Install [Typst](https://typst.app/) (`brew install typst` on macOS) and compile from inside a language directory:

```bash
cd bengali-ipa-basic
typst compile childrens-book.typ bengali-ipa-childrens-book.pdf
typst compile parents-guide.typ bengali-ipa-parents-guide.pdf
```

## Adding a New Language Book Set

1. Create a new folder named `<language>-ipa-basic/`.
2. Add a `data/<language>-letters.json` dataset, `shared/theme.typ`, `childrens-book.typ`, and `parents-guide.typ`.
3. Register the new directory in the table above.

## License

Proprietary — Copyright © 2026 **Fun In Phonetics LLC**. All rights reserved. See [`LICENSE`](./LICENSE) for details.
