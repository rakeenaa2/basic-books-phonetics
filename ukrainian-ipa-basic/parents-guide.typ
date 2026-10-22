// Ukrainian Alphabet with IPA — Parents' Articulatory Phonetics & Coaching Guide (Pilot: Щ /ʃt͡ʃ/)
// Copyright (c) 2026 Fun In Phonetics LLC. All rights reserved.
#import "shared/theme.typ": *

#let data = json("data/ukrainian-letters.json")
#let meta = data.book_meta
#let entry = data.letters.at(0)

#set document(
  title: meta.title_uk + " — " + meta.subtitle_parent,
  author: "Fun In Phonetics LLC",
)
#set page(
  paper: "a4",
  margin: (x: 34pt, y: 32pt),
  footer-descent: 10pt,
  fill: palette.paper,
  header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, auto),
        text(size: 8.5pt, fill: palette.ink.lighten(30%))[#uk(meta.title_uk) · #meta.subtitle_parent],
        text(size: 8.5pt, weight: "bold", fill: palette.river)[Pilot Focus: #uk(entry.letter) /#entry.ipa/]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.75pt + palette.ink.lighten(60%))
    ]
  },
  footer: copyright-footer(show-page-num: true, show-rule: true),
)
#set text(font: font-body, fill: palette.ink, size: 10pt)
#show regex("/[^/\s]+/|\[[^\]\s]+\]"): set text(font: font-ipa)
#set par(leading: 0.6em)

// ============================================================================
// PAGE 1: COVER + SECTION 1 (CRASH COURSE IN UKRAINIAN IPA) + SECTION 2 (MATRIX)
// ============================================================================
#neo-card(bg: palette.sky, inset: 18pt, radius: 18pt)[
  #grid(
    columns: (1fr, auto),
    gutter: 16pt,
    align: horizon,
    [
      #pill-badge("PARENTS' COMPANION MANUAL · PILOT EDITION", bg: palette.ink, fg: palette.sun, size: 8.5pt)
      #v(6pt)
      #uk(meta.title_uk, size: 22pt)
      #h(8pt)
      #text(size: 15pt, weight: "bold")[#meta.subtitle_parent]
      #v(4pt)
      #text(size: 9.5pt)[
        A phonological and articulatory coaching manual designed to pair directly with the Children's IPA Sound Book.
        Dialect standard: _#meta.dialect _.
      ]
    ],
    ipa-hero-badge(entry.ipa_base, entry.ipa_modifier, size: 28pt)
  )
]

#v(12pt)

// SECTION 1: CRASH COURSE IN UKRAINIAN IPA FOR PARENTS
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[1. Crash Course: Why IPA Beats English Romanization]
#v(4pt)
#text(size: 9.5pt)[
  Traditional transliteration writes a clumsy four-letter cluster _"shch"_ for Ukrainian *#uk(entry.letter)*, leaving parents guessing whether to pronounce a long soft _"sh"_ (as in Russian) or two separate syllables. The *International Phonetic Alphabet (IPA)* notation #box[#ipa-text("/" + entry.ipa + "/", size: 9.5pt)] reveals the exact Ukrainian phonetic truth: one Cyrillic letter encoding a postalveolar fricative #box[#ipa-text("/ʃ/", size: 9.5pt, fill: palette.ipa-base)] immediately followed by a tied postalveolar affricate #box[#ipa-text("/t͡ʃ/", size: 9.5pt, fill: palette.ipa-puff)].
]

#v(6pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  ..data.ipa_key.map(item => {
    let sym-color = if item.symbol == "t͡ʃ" { palette.ipa-puff } else if item.symbol == "ʃ" { palette.ipa-base } else { palette.ink }
    neo-card(bg: white, inset: 10pt, radius: 12pt)[
      #grid(
        columns: (44pt, 1fr),
        gutter: 10pt,
        align: horizon,
        box(
          width: 44pt,
          height: 44pt,
          fill: palette.sky.lighten(30%),
          stroke: 1.5pt + palette.ink,
          radius: 10pt,
          align(center + horizon)[#ipa-text(item.symbol, size: 17pt, fill: sym-color)]
        ),
        [
          #text(size: 9.5pt, weight: "bold", fill: sym-color)[#item.name]
          #linebreak()
          #text(size: 8.5pt)[#item.parent_desc]
        ]
      )
    ]
  })
)

#v(14pt)

// SECTION 2: UKRAINIAN CORONAL SIBILANT & AFFRICATE ARTICULATORY MATRIX
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[2. Articulatory Grid Position (Ukrainian Sibilants & Affricates)]
#v(4pt)
#text(size: 9.5pt)[
  Ukrainian organizes its coronal sibilants and affricates by *Place of Articulation* (Dental/Alveolar vs. Postalveolar) and *Manner / Voicing* (Fricatives, Tied Affricates, and Compound Clusters). Below is where our pilot letter *#uk(entry.letter) (#ipa-text("/" + entry.ipa + "/", size: 9.5pt))* sits as the synthesis of *#uk("Ш") (#ipa-text("/ʃ/", size: 9.5pt))* + *#uk("Ч") (#ipa-text("/t͡ʃ/", size: 9.5pt))*:
]

#v(6pt)
#table(
  columns: (1.35fr, 1fr, 1fr, 1.05fr, 1.05fr, 1.35fr),
  align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  stroke: 1.2pt + palette.ink,
  inset: 7pt,
  fill: (x, y) => {
    if y == 0 { palette.ink }
    else if x == 5 and y == 2 { palette.cons-bg }
    else if x == 0 { palette.sky.lighten(40%) }
    else { white }
  },
  // Header Row
  text(fill: white, weight: "bold", size: 8.5pt)[Row / Place],
  text(fill: white, weight: "bold", size: 8pt)[Col 1: Voiceless\ Fricative],
  text(fill: white, weight: "bold", size: 8pt)[Col 2: Voiced\ Fricative],
  text(fill: white, weight: "bold", size: 8pt)[Col 3: Voiceless\ Affricate],
  text(fill: white, weight: "bold", size: 8pt)[Col 4: Voiced\ Affricate],
  text(fill: palette.sun, weight: "bold", size: 8pt)[Col 5: Compound\ Fricative + Affricate],

  // Row 1: Dental / Alveolar (Hissing Series)
  [*1. Dental / Alveolar*\ (Hissing · Свистячі)],
  [#uk("С", size: 11pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/s/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#uk("З", size: 11pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/z/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#uk("Ц", size: 11pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/t͡s/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#uk("ДЗ", size: 10pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/d͡z/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  text(size: 8pt, fill: palette.ink.lighten(55%))[—\ _(No single letter)_],

  // Row 2: Postalveolar (Hushing Series — SPOTLIGHT ROW)
  [*2. Postalveolar*\ (Hushing · Шиплячі)],
  [#uk("Ш", size: 12pt) #h(2pt) #ipa-text("/ʃ/", size: 9pt, fill: palette.ipa-base)\ _(Part 1 of Щ)_],
  [#uk("Ж", size: 11pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/ʒ/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#uk("Ч", size: 12pt) #h(2pt) #ipa-text("/t͡ʃ/", size: 9pt, fill: palette.ipa-puff)\ _(Part 2 of Щ)_],
  [#uk("ДЖ", size: 10pt, fill: palette.ink.lighten(45%)) #h(2pt) #ipa-text("/d͡ʒ/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [
    #uk(entry.letter, size: 16pt) #h(4pt)
    #ipa-text("/" + entry.ipa + "/", size: 11pt, fill: palette.ipa-puff)
    #linebreak()
    #pill-badge("PILOT FOCUS (Ш + Ч)", bg: palette.ipa-puff, fg: white, size: 6.5pt)
  ],

  // Row 3: Palatalized / Soft Coronal Series
  [*3. Palatalized*\ (Soft · М'які)],
  [#uk("СЬ", size: 10pt, fill: palette.ink.lighten(55%)) #h(2pt) #ipa-text("/sʲ/", size: 8.5pt, fill: palette.ink.lighten(55%))],
  [#uk("ЗЬ", size: 10pt, fill: palette.ink.lighten(55%)) #h(2pt) #ipa-text("/zʲ/", size: 8.5pt, fill: palette.ink.lighten(55%))],
  [#uk("ЦЬ", size: 10pt, fill: palette.ink.lighten(55%)) #h(2pt) #ipa-text("/t͡sʲ/", size: 8.5pt, fill: palette.ink.lighten(55%))],
  [#uk("ДЗЬ", size: 9.5pt, fill: palette.ink.lighten(55%)) #h(2pt) #ipa-text("/d͡zʲ/", size: 8.5pt, fill: palette.ink.lighten(55%))],
  [#ipa-text("[ʃʲt͡ʃʲ]", size: 8.5pt, fill: palette.ink.lighten(55%))\ _(Before І / Я / Ю / Є)_],
)

#pagebreak()

// ============================================================================
// PAGE 2: SECTION 3 — DEEP-DIVE COACHING SPREAD FOR 'Щ' (/ʃt͡ʃ/)
// ============================================================================
#text(size: 14pt, weight: "bold", fill: palette.ink)[3. Letter-by-Letter Coaching Deep Dive: #uk(entry.letter) (`/`#ipa-text(entry.ipa, size: 13pt)`/`)]
#v(6pt)

// Top Summary Card
#neo-card(bg: palette.cons-bg.lighten(35%), inset: 12pt, radius: 14pt)[
  #grid(
    columns: (auto, auto, 1fr),
    gutter: 14pt,
    align: horizon,
    box(
      width: 64pt,
      height: 64pt,
      fill: palette.cons-bg,
      stroke: 2.5pt + palette.ink,
      radius: 16pt,
      align(center + horizon)[#uk(entry.letter, size: 36pt)]
    ),
    ipa-hero-badge(entry.ipa_base, entry.ipa_modifier, size: 26pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        [*Voicing:*], [#entry.articulation.voicing],
        [*Place:*], [#entry.articulation.place],
        [*Manner:*], [#entry.articulation.manner],
        [*Airflow:*], [#entry.articulation.airflow],
      )
    ]
  )
]

#v(10pt)

// Two-Column Coaching Guide: Mouth Placement + Tactile Game
#grid(
  columns: (1.15fr, 0.95fr),
  gutter: 12pt,
  // Left: Step-by-Step Vocal Tract Placement
  neo-card(bg: white, inset: 12pt, radius: 14pt)[
    #pill-badge("MOUTH & TONGUE PLACEMENT", bg: palette.ipa-base, fg: white, size: 8pt)
    #v(6pt)
    #for (idx, step) in entry.mouth_placement_steps.enumerate() [
      #grid(
        columns: (20pt, 1fr),
        gutter: 6pt,
        box(
          width: 18pt,
          height: 18pt,
          fill: palette.ink,
          radius: 99pt,
          align(center + horizon)[#text(fill: palette.sun, size: 8.5pt, weight: "bold")[#(idx + 1)]]
        ),
        text(size: 9pt)[#step]
      )
      #v(4pt)
    ]
  ],

  // Right: Tactile Game for Kids
  neo-card(bg: palette.vowel-bg.lighten(25%), inset: 12pt, radius: 14pt)[
    #pill-badge("TACTILE COACHING GAME FOR KIDS", bg: palette.ipa-puff, fg: white, size: 8pt)
    #v(6pt)
    #text(size: 11pt, weight: "bold")[#entry.coaching_game.title]
    #v(4pt)
    #text(size: 9pt)[*Setup:* #entry.coaching_game.setup]
    #v(4pt)
    #text(size: 9pt)[*Action:* #entry.coaching_game.action]
    #v(4pt)
    #box(
      fill: white,
      stroke: 1.5pt + palette.ink,
      radius: 8pt,
      inset: 7pt,
      text(size: 8.5pt)[*Success Cue:* #entry.coaching_game.success_cue]
    )
  ]
)

#v(10pt)

// Phonemic Anatomy of the Example Word: щука (/ʃt͡ʃuka/)
#neo-card(bg: palette.soft-card, inset: 12pt, radius: 14pt)[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(size: 11pt, weight: "bold")[Word Phonetic Anatomy: #uk(entry.word, size: 14pt) → `/`#ipa-text(entry.word_ipa, size: 12pt, fill: palette.river)`/` (“#entry.gloss”)]
    ],
    pill-badge("SYLLABLES: /ʃt͡ʃu/ + /ka/", bg: palette.ink, fg: white, size: 8pt)
  )
  #v(6pt)
  #table(
    columns: (55pt, 65pt, 155pt, 1fr),
    stroke: 1pt + palette.ink.lighten(30%),
    inset: 6pt,
    fill: (x, y) => if y == 0 { palette.ink } else { white },
    text(fill: white, weight: "bold", size: 8pt)[Letter],
    text(fill: white, weight: "bold", size: 8pt)[IPA],
    text(fill: white, weight: "bold", size: 8pt)[Phonetic Role],
    text(fill: white, weight: "bold", size: 8pt)[Parent Coaching Note],
    ..entry.word_breakdown.map(seg => (
      align(center)[#uk(seg.grapheme, size: 13pt)],
      align(center)[#ipa-text(seg.ipa, size: 10pt, fill: palette.river)],
      text(size: 8.5pt, weight: "bold")[#seg.role],
      text(size: 8.5pt)[#seg.note],
    )).flatten()
  )
]

#v(10pt)

// Common Pitfalls & Interference Fixes
#neo-card(bg: palette.spec-bg.lighten(45%), inset: 12pt, radius: 14pt)[
  #pill-badge("COMMON PRONUNCIATION PITFALLS & FIXES", bg: palette.spec-accent, fg: white, size: 8pt)
  #v(6pt)
  #for pitfall in entry.common_pitfalls [
    #text(size: 9.2pt, weight: "bold", fill: palette.spec-accent)[• #pitfall.issue:]
    #h(4pt)
    #text(size: 8.8pt)[#pitfall.fix]
    #v(3pt)
  ]
]
