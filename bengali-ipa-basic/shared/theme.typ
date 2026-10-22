// Shared Color Palette, Typography & IPA Components
// Fun In Phonetics LLC — Bengali IPA Basic Book Series

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
  ipa-base: rgb("#1FA3A8"),      // Affricate / base articulation (River Teal)
  ipa-puff: rgb("#D63E78"),      // Aspiration ʰ burst (Lily Magenta)
  ipa-dental: rgb("#E8A800"),    // Dental bridge t̪ (Sun Gold)
  soft-card: rgb("#F4FBFD"),
)

// Font stacks using macOS built-in Bengali and Unicode/IPA fonts for zero-warning builds
#let font-bn = ("Kohinoor Bangla", "Bangla Sangam MN", "Arial Unicode MS")
#let font-ipa = ("Helvetica Neue", "Lucida Grande", "Arial Unicode MS")
#let font-body = ("Avenir Next", "Helvetica Neue", "Arial")

// Helper for rendering Bengali script spans
#let bn(body, size: 1em, weight: "bold", fill: palette.ink) = {
  text(font: font-bn, size: size, weight: weight, fill: fill, body)
}

// Helper for rendering high-prominence IPA strings
#let ipa-text(body, size: 1.2em, weight: "bold", fill: palette.ink) = {
  text(font: font-ipa, size: size, weight: weight, fill: fill, body)
}

// Color-coded IPA Badge that highlights base articulation vs. aspiration puff (ʰ)
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
