// Bengali Alphabet with IPA — Children's Sound Book (Pilot Edition: ছ /t͡ʃʰ/)
// Copyright (c) 2026 Fun In Phonetics LLC. All rights reserved.
#import "shared/theme.typ": *

#let data = json("data/bengali-letters.json")
#let meta = data.book_meta
#let entry = data.letters.at(0)

#set document(
  title: meta.title_bn + " — " + meta.subtitle_child,
  author: "Fun In Phonetics LLC",
)
#set page(
  paper: "a5",
  flipped: true,
  margin: (x: 20pt, top: 13pt, bottom: 17pt),
  footer-descent: 5pt,
  fill: palette.sky,
  footer: copyright-footer(show-page-num: true),
)
#set text(font: font-body, fill: palette.ink, size: 11pt)

// ============================================================================
// PAGE 1: COVER PAGE
// ============================================================================
#align(center + horizon)[
  #neo-card(bg: palette.paper, inset: 24pt, radius: 24pt)[
    #pill-badge("CHILDREN'S IPA SOUND BOOK · PILOT EDITION", bg: palette.river, fg: white, size: 9.5pt)
    #v(10pt)
    #box(
      fill: palette.sun,
      radius: 99pt,
      inset: (x: 20pt, y: 8pt),
      stroke: 2.5pt + palette.ink,
      bn(meta.title_bn, size: 34pt)
    )
    #v(8pt)
    #text(size: 22pt, weight: "bold", fill: palette.ink)[#meta.subtitle_child]
    #v(6pt)
    #text(size: 11.5pt, fill: palette.ink.lighten(15%))[
      Learn Bengali letters through *real IPA sounds* — where the sound comes first!
    ]
    #v(12pt)
    #grid(
      columns: (auto, auto, auto),
      gutter: 14pt,
      align: horizon,
      box(
        fill: palette.cons-bg,
        stroke: 3pt + palette.ink,
        radius: 20pt,
        inset: (x: 22pt, y: 12pt),
        bn(entry.letter, size: 42pt)
      ),
      text(size: 24pt, weight: "bold", fill: palette.river)[→],
      ipa-hero-badge(entry.ipa_base, entry.ipa_modifier, size: 34pt)
    )
    #v(10pt)
    #pill-badge("Color-Coded IPA · Mouth Cues · Standard Bengali Pronunciation", bg: palette.ink, fg: palette.sun, size: 9pt)
    #v(8pt)
    #text(size: 7.5pt, fill: palette.ink.lighten(25%))[
      *#copyright-notice* #copyright-disclaimer
    ]
  ]
]

#pagebreak()

// ============================================================================
// PAGE 2: "HOW SOUNDS WORK" — VISUAL IPA KEY FOR KIDS
// ============================================================================
#block(width: 100%)[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(size: 20pt, weight: "bold")[How Our Sound Symbols (IPA) Work!]
      #v(2pt)
      #text(size: 10.5pt)[Every symbol inside the `/  /` slashes tells your mouth and tongue what to do.]
    ],
    pill-badge("SOUND DECODER KEY", bg: palette.lily, fg: white, size: 9pt)
  )
  #v(10pt)

  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    ..data.ipa_key.map(item => {
      let badge-bg = if item.symbol == "ʰ" { palette.spec-bg } else if item.symbol == "t͡ʃ" { palette.cons-bg } else { palette.vowel-bg }
      let sym-color = if item.symbol == "ʰ" { palette.ipa-puff } else if item.symbol == "t͡ʃ" { palette.ipa-base } else { palette.ink }
      neo-card(bg: palette.paper, inset: 13pt, radius: 16pt)[
        #grid(
          columns: (64pt, 1fr),
          gutter: 12pt,
          align: horizon,
          box(
            width: 64pt,
            height: 64pt,
            fill: badge-bg,
            stroke: 2.5pt + palette.ink,
            radius: 14pt,
            align(center + horizon)[
              #ipa-text(item.symbol, size: 24pt, fill: sym-color)
            ]
          ),
          [
            #pill-badge(item.kid_cue, bg: sym-color, fg: white, size: 8.5pt)
            #v(4pt)
            #text(size: 11.5pt, weight: "bold")[#item.name]
            #v(2pt)
            #text(size: 9.8pt)[#item.kid_desc]
          ]
        )
      ]
    })
  )

  #v(10pt)
  #neo-card(bg: palette.vowel-bg, inset: 11pt, radius: 14pt)[
    #align(center)[
      #text(weight: "bold", size: 10.5pt)[
        Color Code Secret:
        #box(fill: palette.ipa-base, radius: 4pt, inset: (x: 6pt, y: 2pt), text(fill: white)[Teal #ipa-text("t͡ʃ", size: 10.5pt, fill: white)]) = Tongue Action
        #h(8pt) · #h(8pt)
        #box(fill: palette.ipa-puff, radius: 4pt, inset: (x: 6pt, y: 2pt), text(fill: white)[Pink #ipa-text("ʰ", size: 10.5pt, fill: white)]) = Big Puff of Wind!
      ]
    ]
  ]
]

#pagebreak()

// ============================================================================
// PAGE 3: FEATURE SPREAD FOR 'ছ' (/t͡ʃʰ/)
// ============================================================================
#block(width: 100%)[
  // Header bar
  #grid(
    columns: (auto, 1fr, auto),
    gutter: 10pt,
    align: horizon,
    pill-badge(entry.category_label_bn + " · " + entry.category_label_en, bg: palette.cons-accent, fg: white, size: 9.5pt),
    [],
    pill-badge("IPA FOCUS: /" + entry.ipa + "/", bg: palette.ink, fg: palette.sun, size: 9.5pt)
  )
  #v(8pt)

  // Top Row: Giant Letter + Giant IPA Hero Callout + 3-Part Sound Recipe
  #grid(
    columns: (1.1fr, 1.3fr),
    gutter: 10pt,
    // Left: Letter + Dominant IPA
    neo-card(bg: palette.paper, inset: 11pt, radius: 16pt)[
      #align(center)[
        #text(size: 9pt, weight: "bold", fill: palette.ink.lighten(20%))[SAY THE SOUND FIRST, THEN THE LETTER!]
        #v(6pt)
        #grid(
          columns: (auto, auto),
          gutter: 12pt,
          align: horizon,
          // Bengali Glyph Blob
          box(
            width: 78pt,
            height: 78pt,
            fill: palette.cons-bg,
            stroke: 3pt + palette.ink,
            radius: 22pt,
            align(center + horizon)[
              #bn(entry.letter, size: 46pt)
            ]
          ),
          // IPA Hero Callout
          [
            #ipa-hero-badge(entry.ipa_base, entry.ipa_modifier, size: 30pt)
            #v(5pt)
            #pill-badge("PUFFY 'CHH' SOUND", bg: palette.ipa-puff, fg: white, size: 8pt)
          ]
        )
      ]
    ],

    // Right: 3-Step Sound Recipe for /t͡ʃʰ/
    neo-card(bg: palette.soft-card, inset: 10pt, radius: 16pt)[
      #text(size: 10.5pt, weight: "bold", fill: palette.ink)[Sound Recipe: How to Build #ipa-text("/t͡ʃʰ/", size: 11pt, fill: palette.river)]
      #v(4pt)
      #for part in entry.sound_recipe [
        #let p-color = if part.part == "ʰ" { palette.ipa-puff } else { palette.ipa-base }
        #box(
          width: 100%,
          fill: white,
          stroke: 1.5pt + palette.ink,
          radius: 9pt,
          inset: (x: 8pt, y: 4pt),
          grid(
            columns: (34pt, 1fr),
            gutter: 8pt,
            align: horizon,
            align(center)[#ipa-text(part.part, size: 14pt, fill: p-color)],
            [
              #text(size: 9pt, weight: "bold", fill: p-color)[#part.label]
              #linebreak()
              #text(size: 8pt)[#part.detail]
            ]
          )
        )
        #v(2pt)
      ]
    ]
  )

  #v(7pt)

  // Bottom Row: Word Showcase Card ('ছাতা' /t͡ʃʰat̪a/) with IPA Weight
  #neo-card(bg: palette.vowel-bg.lighten(35%), inset: 11pt, radius: 16pt)[
    #grid(
      columns: (1fr, 1.3fr),
      gutter: 12pt,
      align: horizon,
      // Left: Bengali Word + Gloss
      [
        #pill-badge("EXAMPLE WORD", bg: palette.ink, fg: white, size: 8pt)
        #v(4pt)
        #bn(entry.word, size: 32pt)
        #h(8pt)
        #text(size: 15pt, weight: "bold", fill: palette.ink)[“#entry.gloss”]
        #v(4pt)
        #text(size: 9pt)[
          Hold your hand in front of your mouth when you start saying *#bn(entry.word, size: 10pt)* — feel the big puff of air on #ipa-text("/t͡ʃʰ/", size: 9.5pt, fill: palette.ipa-puff)!
        ]
      ],
      // Right: Oversized Color-Coded Word IPA Breakdown
      neo-card(bg: white, inset: 10pt, radius: 12pt)[
        #align(center)[
          #text(size: 8.5pt, weight: "bold", fill: palette.river)[WORD IN IPA (SOUND BY SOUND)]
          #v(4pt)
          #box(
            fill: palette.sky.lighten(40%),
            stroke: 2pt + palette.ink,
            radius: 10pt,
            inset: (x: 14pt, y: 6pt),
            [
              #ipa-text("/", size: 24pt, fill: palette.ink)
              #ipa-text("t͡ʃ", size: 24pt, fill: palette.ipa-base)
              #ipa-text("ʰ", size: 24pt, fill: palette.ipa-puff)
              #ipa-text("a", size: 24pt, fill: palette.ink)
              #ipa-text(" · ", size: 20pt, fill: palette.ink.lighten(50%))
              #ipa-text("t̪", size: 24pt, fill: palette.ipa-dental)
              #ipa-text("a", size: 24pt, fill: palette.ink)
              #ipa-text("/", size: 24pt, fill: palette.ink)
            ]
          )
          #v(5pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 6pt,
            pill-badge("Beat 1: /t͡ʃʰa/ (Puffy Chha!)", bg: palette.ipa-puff, fg: white, size: 8pt),
            pill-badge("Beat 2: /t̪a/ (Teeth Ta)", bg: palette.ipa-dental, fg: palette.ink, size: 8pt),
          )
        ]
      ]
    )
  ]
]
