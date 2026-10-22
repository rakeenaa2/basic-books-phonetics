// Bengali Alphabet with IPA — Parents' Articulatory Phonetics & Coaching Guide (Pilot: ছ /t͡ʃʰ/)
#import "shared/theme.typ": *

#let data = json("data/bengali-letters.json")
#let meta = data.book_meta
#let entry = data.letters.at(0)

#set page(
  paper: "a4",
  margin: (x: 34pt, y: 32pt),
  fill: palette.paper,
  header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, auto),
        text(size: 8.5pt, fill: palette.ink.lighten(30%))[#bn(meta.title_bn) · #meta.subtitle_parent],
        text(size: 8.5pt, weight: "bold", fill: palette.river)[Pilot Focus: #bn(entry.letter) /#entry.ipa/]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.75pt + palette.ink.lighten(60%))
    ]
  },
)
#set text(font: font-body, fill: palette.ink, size: 10pt)
#set par(leading: 0.6em)

// ============================================================================
// PAGE 1: COVER + SECTION 1 (CRASH COURSE IN BENGALI IPA) + SECTION 2 (MATRIX)
// ============================================================================
#neo-card(bg: palette.sky, inset: 18pt, radius: 18pt)[
  #grid(
    columns: (1fr, auto),
    gutter: 16pt,
    align: horizon,
    [
      #pill-badge("PARENTS' COMPANION MANUAL · PILOT EDITION", bg: palette.ink, fg: palette.sun, size: 8.5pt)
      #v(6pt)
      #bn(meta.title_bn, size: 24pt)
      #h(8pt)
      #text(size: 16pt, weight: "bold")[#meta.subtitle_parent]
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

// SECTION 1: CRASH COURSE IN BENGALI IPA FOR PARENTS
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[1. Crash Course: Why IPA Beats English Romanization]
#v(4pt)
#text(size: 9.5pt)[
  Traditional alphabet books write English approximations like _"chh"_ for *#bn(entry.letter)*. However, English spelling hides three critical phonetic instructions that a child's mouth needs: whether the tongue seals the roof of the mouth, where the tongue tip lands, and whether a burst of air follows. The *International Phonetic Alphabet (IPA)* gives you an exact blueprint of the vocal tract.
]

#v(6pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  ..data.ipa_key.map(item => {
    let sym-color = if item.symbol == "ʰ" { palette.ipa-puff } else if item.symbol == "t͡ʃ" { palette.ipa-base } else if item.symbol == "t̪" { palette.ipa-dental } else { palette.ink }
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

// SECTION 2: THE 5x5 CONSONANT MATRIX CONTEXT MAP
#text(size: 13.5pt, weight: "bold", fill: palette.ink)[2. Articulatory Grid Position (বর্গীয় ব্যঞ্জন · 5×5 Matrix)]
#v(4pt)
#text(size: 9.5pt)[
  Bengali organizes its core stop and affricate consonants into a scientific 5×5 matrix based on *Place of Articulation* (rows) and *Voicing / Aspiration* (columns). Below is where our pilot letter *#bn(entry.letter) (#ipa-text("/" + entry.ipa + "/", size: 9.5pt))* sits inside the system (remaining cells are reserved for the full 50-letter expansion):
]

#v(6pt)
#table(
  columns: (1.25fr, 1fr, 1.25fr, 1fr, 1fr, 0.9fr),
  align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  stroke: 1.2pt + palette.ink,
  inset: 7pt,
  fill: (x, y) => {
    if y == 0 { palette.ink }
    else if x == 2 and y == 2 { palette.cons-bg }
    else if x == 0 { palette.sky.lighten(40%) }
    else { white }
  },
  // Header Row
  text(fill: white, weight: "bold", size: 8.5pt)[Row / Place],
  text(fill: white, weight: "bold", size: 8pt)[Col 1: Voiceless\ Unaspirated],
  text(fill: palette.sun, weight: "bold", size: 8pt)[Col 2: Voiceless\ Aspirated (#ipa-text("ʰ", size: 8.5pt, fill: palette.sun))],
  text(fill: white, weight: "bold", size: 8pt)[Col 3: Voiced\ Unaspirated],
  text(fill: white, weight: "bold", size: 8pt)[Col 4: Voiced\ Breathy (#ipa-text("ʱ", size: 8.5pt, fill: white))],
  text(fill: white, weight: "bold", size: 8pt)[Col 5:\ Nasal],

  // Row 1: Velar
  [*1. Velar*\ (Soft Palate)],
  ipa-text("/k/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/kʰ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ɡ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ɡʱ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ŋ/", size: 8.5pt, fill: palette.ink.lighten(55%)),

  // Row 2: Post-Alveolar / Palatal (SPOTLIGHT ROW)
  [*2. Post-Alveolar*\ (Palatal Series)],
  [#ipa-text("/t͡ʃ/", size: 8.5pt, fill: palette.ink.lighten(45%))\ _(Unaspirated)_],
  [
    #bn(entry.letter, size: 16pt) #h(4pt)
    #ipa-text("/" + entry.ipa + "/", size: 11pt, fill: palette.ipa-puff)
    #linebreak()
    #pill-badge("PILOT FOCUS", bg: palette.ipa-puff, fg: white, size: 6.5pt)
  ],
  ipa-text("/d͡ʒ/", size: 8.5pt, fill: palette.ink.lighten(45%)),
  ipa-text("/d͡ʒʱ/", size: 8.5pt, fill: palette.ink.lighten(45%)),
  ipa-text("/ɲ/", size: 8.5pt, fill: palette.ink.lighten(45%)),

  // Row 3: Retroflex
  [*3. Retroflex*\ (Curled Tongue)],
  ipa-text("/ʈ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ʈʰ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ɖ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ɖʱ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/ɳ/", size: 8.5pt, fill: palette.ink.lighten(55%)),

  // Row 4: Dental
  [*4. Dental*\ (Upper Teeth)],
  ipa-text("/t̪/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/t̪ʰ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/d̪/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/d̪ʱ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/n/", size: 8.5pt, fill: palette.ink.lighten(55%)),

  // Row 5: Labial
  [*5. Labial*\ (Both Lips)],
  ipa-text("/p/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/pʰ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/b/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/bʱ/", size: 8.5pt, fill: palette.ink.lighten(55%)),
  ipa-text("/m/", size: 8.5pt, fill: palette.ink.lighten(55%)),
)

#pagebreak()

// ============================================================================
// PAGE 2: SECTION 3 — DEEP-DIVE COACHING SPREAD FOR 'ছ' (/t͡ʃʰ/)
// ============================================================================
#text(size: 14pt, weight: "bold", fill: palette.ink)[3. Letter-by-Letter Coaching Deep Dive: #bn(entry.letter) (`/`#ipa-text(entry.ipa, size: 13pt)`/`)]
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
      align(center + horizon)[#bn(entry.letter, size: 36pt)]
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

// Phonemic Anatomy of the Example Word: ছাতা (/t͡ʃʰat̪a/)
#neo-card(bg: palette.soft-card, inset: 12pt, radius: 14pt)[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(size: 11pt, weight: "bold")[Word Phonetic Anatomy: #bn(entry.word, size: 14pt) → `/`#ipa-text(entry.word_ipa, size: 12pt, fill: palette.river)`/` (“#entry.gloss”)]
    ],
    pill-badge("SYLLABLES: /t͡ʃʰa/ + /t̪a/", bg: palette.ink, fg: white, size: 8pt)
  )
  #v(6pt)
  #table(
    columns: (55pt, 65pt, 145pt, 1fr),
    stroke: 1pt + palette.ink.lighten(30%),
    inset: 6pt,
    fill: (x, y) => if y == 0 { palette.ink } else { white },
    text(fill: white, weight: "bold", size: 8pt)[Sign],
    text(fill: white, weight: "bold", size: 8pt)[IPA],
    text(fill: white, weight: "bold", size: 8pt)[Phonetic Role],
    text(fill: white, weight: "bold", size: 8pt)[Parent Coaching Note],
    ..entry.word_breakdown.map(seg => (
      align(center)[#bn(seg.grapheme, size: 13pt)],
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
