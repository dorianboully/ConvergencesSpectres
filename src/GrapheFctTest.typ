#import "../lib/lib.typ": *

#canvas(length: 1.3cm, {
  import draw: *

  // --- 1. Paramètres ---
  let val_b = 6.0
  let eps = 2.5
  let eta_val = 1.25
  let h_max = 1.5

  // --- 2. Définition des points clés ---

  // Axe X Positif
  let x_pos_2 = 1.0
  let x_pos_zero_lim = x_pos_2 + eps / 2.0
  let x_pos_one_start = x_pos_2 + eps
  let x_pos_one_end = val_b - eta_val
  let x_pos_b = val_b

  // Axe X Négatif
  let x_neg_2 = -1.0
  let x_neg_zero_lim = x_neg_2 - 1.15
  let x_neg_one_end = x_neg_2 - eps
  let x_neg_b = -5

  // --- 3. Axes ---

  // Axe X
  line((x_neg_b -0.5, 0.0), (x_pos_b + 0.5, 0.0), mark: (end: "stealth"), name: "axis-x", stroke: 0.6pt)
  content("axis-x.end", $x$, anchor: "north-west")

  // Axe Y
  line((0.0, -0.5), (0.0, h_max + 0.5), mark: (end: "stealth"), name: "axis-y", stroke: 0.6pt)
  content("axis-y.end", $y$, anchor: "south-east")

  // Graduation y=1
  line((-0.06, h_max), (0.06, h_max), stroke: 0.6pt)
  content((-0.2, h_max), $1$, anchor: "east")

  // --- 4. Tracé de la courbe (Noir) ---

  let smooth-step(start-pt, end-pt) = {
    let x0 = start-pt.at(0)
    let y0 = start-pt.at(1)
    let x1 = end-pt.at(0)
    let y1 = end-pt.at(1)
    let dist = calc.abs(x1 - x0)

    let c1 = (x0 + dist / 2.0, y0)
    let c2 = (x1 - dist / 2.0, y1)

    bezier(start-pt, end-pt, c1, c2)
  }

  merge-path(stroke: (thickness: 1.5pt, paint: black), {
    // A. Plateau gauche (h=1)
    line((x_neg_b, h_max), (x_neg_one_end, h_max))

    // B. Descente (1 -> 0)
    smooth-step((x_neg_one_end, h_max), (x_neg_zero_lim, 0.0))

    // C. Zéro central (h=0)
    line((x_neg_zero_lim, 0.0), (x_pos_zero_lim, 0.0))

    // D. Montée (0 -> 1)
    smooth-step((x_pos_zero_lim, 0.0), (x_pos_one_start, h_max))

    // E. Plateau droit (h=1)
    line((x_pos_one_start, h_max), (x_pos_one_end, h_max))

    // F. Chute finale (1 -> 0)
    smooth-step((x_pos_one_end, h_max), (x_pos_b, 0.0))
  })

  // --- 5. Ticks et Labels ---

  let xtick(x, label, y-target: 0.0) = {
    // Ligne pointillée seulement si le point cible n'est pas sur l'axe
    if y-target != 0.0 {
      line((x, 0.0), (x, y-target), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
    }
    // Tick mark
    line((x, 0.06), (x, -0.06), stroke: 0.6pt)
    // Label
    content((x, -0.2), label, anchor: "north")
  }

  // --- Ticks Gauche ---
  xtick(x_neg_b, $-b$, y-target: h_max)
  xtick(x_neg_one_end, $-(2 + epsilon)$, y-target: h_max)
  xtick(x_neg_zero_lim, $-(2 + epsilon/2)$) // Nouveau
  xtick(x_neg_2, $-2$) // Nouveau

  // --- Ticks Droite ---
  xtick(x_pos_2, $2$) // Nouveau
  xtick(x_pos_zero_lim, $2 + epsilon/2$)
  xtick(x_pos_one_start, $2 + epsilon$, y-target: h_max)
  xtick(x_pos_one_end, $b - eta$, y-target: h_max)
  xtick(x_pos_b, $b$)
})
