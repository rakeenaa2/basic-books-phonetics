// Arabic Alphabet with IPA — Parents' Articulatory Phonetics & Coaching Guide (Pilot: ص /sˤ/)
// Copyright (c) 2026 Fun In Phonetics LLC. All rights reserved.
#import "shared/theme.typ": *

#let data = json("data/arabic-letters.json")
#let meta = data.book_meta
#let entry = data.letters.at(0)

#set document(
  title: meta.title_ar + " — " + meta.subtitle_parent,
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
        text(size: 8.5pt, fill: palette.ink.lighten(30%))[#ar(meta.title_ar) · #meta.subtitle_parent],
        text(size: 8.5pt, weight: "bold", fill: palette.river)[Pilot Focus: #ar(entry.letter) /#entry.ipa/]
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
// PAGE 1: COVER + SECTION 1 (CRASH COURSE IN ARABIC IPA) + SECTION 2 (MATRIX)
// ============================================================================
#neo-card(bg: palette.sky, inset: 18pt, radius: 18pt)[
  #grid(
    columns: (1fr, auto),
    gutter: 16pt,
    align: horizon,
    [
      #pill-badge("PARENTS' COMPANION MANUAL · PILOT EDITION", bg: palette.ink, fg: palette.sun, size: 8.5pt)
      #v(6pt)
      #ar(meta.title_ar, size: 22pt)
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

// SECTION 1: CRASH COURSE IN ARABIC IPA FOR PARENTS
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[1. Crash Course: Why IPA Beats English Romanization]
#v(4pt)
#text(size: 9.5pt)[
  Popular transliteration schemes write either a capital _"S"_, _"ṣ"_, or _"saad"_ for Arabic *#ar(entry.letter)*—none of which tell a parent how to shape their vocal tract differently from plain *#ar("س")* (_"s"_). The *International Phonetic Alphabet (IPA)* notation #box[#ipa-text("/" + entry.ipa + "/", size: 9.5pt)] makes the dual articulation visible at a glance: a front denti-alveolar sibilant #box[#ipa-text("/s/", size: 9.5pt, fill: palette.ipa-base)] coproduced with pharyngeal tongue-root retraction #box[#ipa-text("ˤ", size: 9.5pt, fill: palette.ipa-puff)] (*tafkhīm* / *iṭbāq*).
]

#v(6pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  ..data.ipa_key.map(item => {
    let sym-color = if item.symbol == "ˤ" { palette.ipa-puff } else if item.symbol == "s" { palette.ipa-base } else { palette.ink }
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

// SECTION 2: ARABIC CORONAL PLAIN VS. EMPHATIC (MUFAKHKHAM) ARTICULATORY MATRIX
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[2. Articulatory Grid Position (Plain vs. Emphatic Coronals · الحروف المفخمة)]
#v(4pt)
#text(size: 9.5pt)[
  Modern Standard Arabic pairs four primary coronal consonants into *Plain (Muraqqaq)* vs. *Emphatic / Pharyngealized (Mufakhkham · المطبق)* minimal counterparts. Below is where our pilot letter *#ar(entry.letter) (#ipa-text("/" + entry.ipa + "/", size: 9.5pt))* sits as the pharyngealized twin of plain *#ar("س") (#ipa-text("/s/", size: 9.5pt))*:
]

#v(6pt)
#table(
  columns: (1.45fr, 1.15fr, 1.35fr, 1.35fr, 1.2fr),
  align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  stroke: 1.2pt + palette.ink,
  inset: 7pt,
  fill: (x, y) => {
    if y == 0 { palette.ink }
    else if x == 2 and y == 1 { palette.cons-bg }
    else if x == 0 { palette.sky.lighten(40%) }
    else { white }
  },
  // Header Row
  text(fill: white, weight: "bold", size: 8.5pt)[Manner & Place],
  text(fill: white, weight: "bold", size: 8pt)[Col 1: Plain\ (Muraqqaq · مرقق)],
  text(fill: palette.sun, weight: "bold", size: 8pt)[Col 2: Emphatic\ (Mufakhkham · #ipa-text("ˤ", size: 8.5pt, fill: palette.sun))],
  text(fill: white, weight: "bold", size: 8pt)[Col 3: Secondary\ Tract Gesture],
  text(fill: white, weight: "bold", size: 8pt)[Col 4: Following\ `/a/` Allophone],

  // Row 1: Voiceless Denti-Alveolar Sibilant (SPOTLIGHT ROW)
  [*1. Voiceless Sibilant*\ (Denti-Alveolar Groove)],
  [#ar("س", size: 13pt) #h(3pt) #ipa-text("/s/", size: 9pt, fill: palette.ipa-base)\ _(Flat tongue)_],
  [
    #ar(entry.letter, size: 16pt) #h(4pt)
    #ipa-text("/" + entry.ipa + "/", size: 11pt, fill: palette.ipa-puff)
    #linebreak()
    #pill-badge("PILOT FOCUS", bg: palette.ipa-puff, fg: white, size: 6.5pt)
  ],
  text(size: 8pt)[Concave dorsum +\ retracted root (#ipa-text("ˤ", size: 8.5pt, fill: palette.ipa-puff))],
  [#ipa-text("[æ]", size: 8.5pt) → *#ipa-text("[ɑ]", size: 9pt, fill: palette.ipa-puff)*],

  // Row 2: Voiceless Denti-Alveolar Stop
  [*2. Voiceless Plosive*\ (Denti-Alveolar Stop)],
  [#ar("ت", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/t/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#ar("ط", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/tˤ/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  text(size: 8pt, fill: palette.ink.lighten(45%))[Unaspirated stop +\ pharyngealization],
  text(size: 8.5pt, fill: palette.ink.lighten(45%))[#ipa-text("[æ]", size: 8.5pt) → #ipa-text("[ɑ]", size: 8.5pt)],

  // Row 3: Voiced Denti-Alveolar Stop
  [*3. Voiced Plosive*\ (Denti-Alveolar Stop)],
  [#ar("د", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/d/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#ar("ض", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/dˤ/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  text(size: 8pt, fill: palette.ink.lighten(45%))[Voiced stop +\ pharyngealization],
  text(size: 8.5pt, fill: palette.ink.lighten(45%))[#ipa-text("[æ]", size: 8.5pt) → #ipa-text("[ɑ]", size: 8.5pt)],

  // Row 4: Voiced Interdental Fricative
  [*4. Voiced Fricative*\ (Interdental Slit)],
  [#ar("ذ", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/ð/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  [#ar("ظ", size: 12pt, fill: palette.ink.lighten(45%)) #h(3pt) #ipa-text("/ðˤ/", size: 8.5pt, fill: palette.ink.lighten(45%))],
  text(size: 8pt, fill: palette.ink.lighten(45%))[Interdental blade +\ pharyngealization],
  text(size: 8.5pt, fill: palette.ink.lighten(45%))[#ipa-text("[æ]", size: 8.5pt) → #ipa-text("[ɑ]", size: 8.5pt)],
)

#pagebreak()

// ============================================================================
// PAGE 2: SECTION 3 — DEEP-DIVE COACHING SPREAD FOR 'ص' (/sˤ/)
// ============================================================================
#text(size: 14pt, weight: "bold", fill: palette.ink)[3. Letter-by-Letter Coaching Deep Dive: #ar(entry.letter) (`/`#ipa-text(entry.ipa, size: 13pt)`/`)]
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
      align(center + horizon)[#ar(entry.letter, size: 36pt)]
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

// Phonemic Anatomy of the Example Word: صُورَة (/sˤuːra/)
#neo-card(bg: palette.soft-card, inset: 12pt, radius: 14pt)[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(size: 11pt, weight: "bold")[Word Phonetic Anatomy: #ar(entry.word, size: 14pt) → `/`#ipa-text(entry.word_ipa, size: 12pt, fill: palette.river)`/` (“#entry.gloss”)]
    ],
    pill-badge("SYLLABLES: /sˤuː/ + /ra/", bg: palette.ink, fg: white, size: 8pt)
  )
  #v(6pt)
  #table(
    columns: (55pt, 65pt, 160pt, 1fr),
    stroke: 1pt + palette.ink.lighten(30%),
    inset: 6pt,
    fill: (x, y) => if y == 0 { palette.ink } else { white },
    text(fill: white, weight: "bold", size: 8pt)[Letter],
    text(fill: white, weight: "bold", size: 8pt)[IPA],
    text(fill: white, weight: "bold", size: 8pt)[Phonetic Role],
    text(fill: white, weight: "bold", size: 8pt)[Parent Coaching Note],
    ..entry.word_breakdown.map(seg => (
      align(center)[#ar(seg.grapheme, size: 13pt)],
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
