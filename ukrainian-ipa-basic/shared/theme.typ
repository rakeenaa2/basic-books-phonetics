// Shared Color Palette, Typography & IPA Components
// Copyright (c) 2026 Fun In Phonetics LLC. All rights reserved.
// Fun In Phonetics LLC — Ukrainian IPA Basic Book Series

#let palette = (
  sun: rgb("#FFC83D"),
  sky: rgb("#DDF3F4"),
  river: rgb("#1FA3A8"),
  lily: rgb("#F26B9A"),
  paddy: rgb("#6CBF4B"),
  ink: rgb("#27315A"),
  paper: rgb("#FFFDF6"),
  // Category fills & accents
  vowel-bg: rgb("#FFE6A8"),
  vowel-accent: rgb("#E8A800"),
  cons-bg: rgb("#CDEFD0"),
  cons-accent: rgb("#3E9B2A"),
  spec-bg: rgb("#FFD3E1"),
  spec-accent: rgb("#D63E78"),
  // Phonetic feature accents (for IPA breakdown)
  ipa-base: rgb("#1FA3A8"),      // Base postalveolar fricative /ʃ/ (River Teal)
  ipa-puff: rgb("#D63E78"),      // Tied affricate release /t͡ʃ/ (Lily Magenta)
  ipa-dental: rgb("#E8A800"),    // Crisp unaspirated stop /k/ (Sun Gold)
  soft-card: rgb("#F4FBFD"),
)

// Font stacks using macOS built-in Cyrillic and Unicode/IPA fonts for zero-warning builds
#let font-uk = ("Avenir Next", "Helvetica Neue", "Arial Unicode MS")
#let font-ipa = ("Helvetica Neue", "Lucida Grande", "Arial Unicode MS")
#let font-body = ("Avenir Next", "Helvetica Neue", "Arial")

// Helper for rendering Ukrainian Cyrillic script spans
#let uk(body, size: 1em, weight: "bold", fill: palette.ink) = {
  text(font: font-uk, size: size, weight: weight, fill: fill, body)
}

// Alias bn to uk for cross-language template parity
#let bn = uk

// Helper for rendering high-prominence IPA strings
#let ipa-text(body, size: 1.2em, weight: "bold", fill: palette.ink) = {
  text(font: font-ipa, size: size, weight: weight, fill: fill, body)
}

// Color-coded IPA Badge that highlights opening fricative (ʃ) vs. tied affricate release (t͡ʃ)
#let ipa-hero-badge(base, modifier, size: 36pt) = {
  box(
    fill: white,
    stroke: 3pt + palette.ink,
    radius: 18pt,
    inset: (x: 18pt, y: 12pt),
    [
      #text(font: font-ipa, size: size, weight: "bold", fill: palette.ink)[/]
      #text(font: font-ipa, size: size, weight: "bold", fill: palette.ipa-base)[#base]
      #text(font: font-ipa, size: size, weight: "bold", fill: palette.ipa-puff)[#modifier]
      #text(font: font-ipa, size: size, weight: "bold", fill: palette.ink)[/]
    ]
  )
}

// Stylized Category Pill Badge
#let pill-badge(label, bg: palette.ink, fg: white, size: 10pt) = {
  box(
    fill: bg,
    radius: 99pt,
    inset: (x: 10pt, y: 5pt),
    text(font: font-body, size: size, weight: "bold", fill: fg, label)
  )
}

// Framed Card Container matching the playful neo-brutalist border style
#let neo-card(
  body,
  bg: palette.paper,
  border-color: palette.ink,
  accent-bar: none,
  inset: 16pt,
  radius: 18pt,
) = {
  block(
    width: 100%,
    fill: bg,
    stroke: 2.5pt + border-color,
    radius: radius,
    inset: inset,
    breakable: false,
    body
  )
}

// Proprietary copyright & disclaimer constants (Fun In Phonetics LLC)
#let copyright-notice = "© 2026 Fun In Phonetics LLC. All rights reserved."
#let copyright-disclaimer = "Proprietary material. Unauthorized reproduction, redistribution, or commercial use in print or digital form is prohibited."

// Reusable page footer rendering copyright & proprietary disclaimer
#let copyright-footer(show-page-num: true, show-rule: false) = context {
  let page-num = counter(page).get().first()
  let total-pages = counter(page).final().first()
  if show-rule [
    #line(length: 100%, stroke: 0.6pt + palette.ink.lighten(65%))
    #v(3pt)
  ]
  grid(
    columns: if show-page-num { (1fr, auto) } else { (1fr,) },
    gutter: 8pt,
    align: horizon,
    text(font: font-body, size: 6.2pt, fill: palette.ink.lighten(25%))[
      *#copyright-notice* #copyright-disclaimer
    ],
    ..if show-page-num {
      (text(font: font-body, size: 6.2pt, weight: "bold", fill: palette.ink.lighten(25%))[Page #page-num of #total-pages],)
    } else {
      ()
    }
  )
}
