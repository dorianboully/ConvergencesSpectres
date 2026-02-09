#import "../lib/lib.typ": *

#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  numbering: none,
)

// --- DÉBUT DE LA PAGE DE TITRE ---

#align(center)[
  // En-tête Institutionnel
  #text(size: 14pt, weight: "regular")[#smallcaps("Collège de France")] \
  #v(0.5em)
  #text(size: 12pt, style: "italic")[Chaire Géométrie Spectrale] 
  
  #v(3em) // Espace vertical

  // --- TITRE ---
  #line(length: 100%, stroke: 0.5pt) // Ligne fine au-dessus
  #v(0.8em)
  
  #text(size: 24pt, weight: "bold")[
    Convergences de spectres \ et notes fondamentales
  ]
  
  #v(0.8em)
  #line(length: 100%, stroke: 0.5pt) // Ligne fine en-dessous
  
  #v(1em)
  #text(size: 14pt, weight: "medium")[Notes de cours]
  
  #v(2fr) // Espace flexible qui pousse l'image au centre
  
  // --- BLOC IMAGE ET COPYRIGHT ---
  #block[
    // Remplacez "image.png" par votre fichier
    #image("anantharaman_2025-2026_cours_vignette.jpg", width: 70%)
    #v(0.5em)
    #text(size: 8pt, fill: gray.darken(30%))[
      © Alicia J. Kollár, Mattias Fitzpatrick, Peter Sarnak & Andrew A. Houck
    ]
  ]
  
  #v(2fr) // Espace flexible
  
  // --- CRÉDITS ---
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    align: (center, center),
    
    // Colonne Professeure
    [
      #text(size: 11pt, style: "italic", gray)[Cours donné par] \
      #v(0.3em)
      #text(size: 13pt, weight: "bold")[Pr. Nalini Anantharaman]
    ],
    
    // Colonne Rédacteur
    [
      #text(size: 11pt, style: "italic", gray)[Notes rédigées par] \
      #v(0.3em)
      #text(size: 13pt, weight: "bold")[Dorian Boully]
    ]
  )

  #v(4em) // Espace avant la date
  
  #line(length: 30%, stroke: 0.5pt + gray)
  #v(0.5em)
  #text(size: 11pt)[Année 2025 - 2026]
]

