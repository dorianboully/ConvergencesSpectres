#import "../lib/lib.typ": *

=== Quelques conséquences de la convergence au sens de Benjamini-Schramm

#theorem[
  Soit $(X_n, d_n, m_n)$ une suite d'espaces métriques mesurés, satisfaisant
  $RCD(K, N)$, qui converge au sens de Benjamini-Schramm vers
  $(X_(∞), d_(∞), x_(∞) m_(∞))$ aléatoire de loi $PP_(∞)$.
  On suppose qu'il existe un réel $v_(0) > 0$ tel que
  $
    ∀n in ℕ, ∀ x in X_n, quad m_(n) (B(x, 1)) ⩾ v_0 > 0.
  $
  Alors il y a "convergence du noyau de la chaleur"
  #equation(id: "eqCVNoyauChaleur")[
    $
      forall t > 0, quad 1/(m_n (X_n)) op("Tr") (exp(t Δ_(X_n)))
      stretch(arrow)_(n -> ∞) 𝔼_(∞)[ exp(t Δ_(X_(∞))) (x_(∞), x_(∞)) ].
    $
  ]
]<thCVNoyauChaleur>

#remark[
  - On rappelle que la condition $RCD(K, N)$, vue sans détails à la première séance,
    implique en particulier l'existence d'un laplacien auto-adjoint sur les $X_n$
  - La membre de gauche de @eqCVNoyauChaleur s'exprime sous la forme
    $
      1/(m_n (X_n)) op("Tr") (exp(t Δ_(X_n)))
      & = 1/(m_n (X_n)) integral_(X_n) p_(t)^(X_n) (z, z) dif m_n (z)\
      & = 1/(m_n (X_n)) sum_(λ in op("Sp")(Δ_(X_n))) exp[-t λ op("mult")(λ)], & #h(1cm) "(cas compact)"
    $
  //TODO: pas compris grand chose
]

La preuve du @thCVNoyauChaleur utilise des résultats de Gigli-Mondino-Savaré sur la stabilité
de $p_(t)^(X_n)$, ainsi que des bornes a priori sur $p_t$, qui demandent la condition de minoration
de la mesure des boules unités.

#example[
  + Le @thCVNoyauChaleur s'applique en particulier à l'exemple
    $X_n = (G slash K) slash Γ_n$ avec $G$ groupe de Lie semi-simple,
    sous l'hypothèse que $X_n$ converge au sens de Benjamini-Schramm vers $G slash K$
    (c'est un espace homogène donc le choix du point de base n'a pas d'importance), et que
    le rayon d'injectivité est minoré. La condition de convergence est automatiquement satisfaite
    si $G$ est de rang $⩾ 2$ et possède la propriété $(T)$
  + Soit $tilde(M) --> M$ le revêtement universel d'une variété riemannienne compacte
    $M = tilde(M) slash Γ$. Soit $(Γ_(n))$ une suite de sous-groupes du groupe d'automorphismes
    de $tilde(M)$, tels que $X_n = tilde(M) / Γ_(n)$ soit compact. Si le rayon d'injectivité
    de $X_n$ tend vers l'infini, alors
    $
      X_n stretch(arrow)_(n -> ∞)^("B-S")
      1/(op("vol")(D)) integral_(D) δ_(tilde(M), x) dif op("vol")(x),
    $
    où $D$ est un domaine fondamental de l'action de $Γ$ sur $tilde(M)$.
  + *Modèles de surfaces hyperboliques aléatoires.*
    - *Modèle de Weil-Peterson et des revêtements aléatoires.* Dans les deux cas,
      il y a convergence presque sûre (on utilise plutôt la convergence en probabilité
      dans la littérature) //TODO: préciser, différence ?
      quand le volume (ou de manière équivalente le genre) tend vers l'infini,
      vers l'espace hyperbolique $ℍ^2$.
    - *Modèle de Budzinski-Curien-Petri (2019).* On part d'un graphe $3$-régulier aléatoire
      à $N$ sommets, qui encode le recollement de $N$ pantalons hyperboliques de
      longueur de bord fixée sans twist. //TODO: figure. Twist = torsion ?
      Dans ce cas, il y a convergence presque sûre au sens de Benjamini-Schramm vers une surface
      hyperbolique non compacte correspondant au recollement de pantalons selon l'arbre infini
      $3$-régulier, avec point base choisi uniformément dans un des pantalons.
]<exCVBSMetrique>

#theorem(title: "7 samourais")[
  Dans le cadre du @exCVBSMetrique[1) de l'exemple], il y a convergence du noyau
  de la chaleur sur les $k$-formes pour tout $k in {0, ..., dim(G slash K)}$. Plus précisément,
  si $Δ_((k))^(n)$ désigne le laplacien sur les $k$-formes $L^(2)$ de $X_n$ ($n in NN ∪ {∞}$), alors
  $
    forall t ⩾ 0, quad 1/(op("vol")(X_n)) op("Tr") (exp(t Δ_((k))^(n)))
    stretch(arrow)_(n -> ∞) 𝔼_(∞)[ exp(t Δ_((k))^(∞)) (o, o) ].
  $
  En prenant la limite $t -> ∞$, on obtient la convergence des nombres de Betti normalisés
  $
    (b_k (X_n)) / (op("vol")(X_n)) stretch(arrow)_(n -> ∞)
    lim_(t -> ∞) 𝔼_(∞)[ exp(t Δ_((k))^(∞)) (o, o) ] =: β_(k). //TODO: besoin de l'esperance ou pas, ou bien trace sur les fibres (selon remarque de Nalini) ? A revérifier.
  $
  On appelle $β_(k)$ le $k$-ième nombre de Betti $L^2$ de l'espace symétrique $G slash K$.
]

#theorem(title: [Elek, Bowen (2012) -- Abert-Bergeron-Biringer-Gelander (2016)])[
  Si $ (X_n, d_n, m_n) stretch(arrow)_(n -> ∞)^("B-S") (X_(∞), d_(∞), m_(∞)) $
  avec des espaces satisfaisant "de bonnes conditions" // TODO: référence ?
  alors pour tout $k$, les nombres de Betti normalisés possèdent une limite quand
  $n -> ∞$.
]

Dans ce cadre, les nombres de Betti sont définis par homologie simpliciale.

= Convergence spectrale forte des graphes réguliers aléatoires <secCVSpecForteGraphesReguliers>
== La preuve de Friedman (d'après @friedmanSecondEigenvalueRandom1991@friedmanProofAlonsSecond2008a)
Soit $d = q + 1$ un entier fixé. On s'intéresse aux graphes $d$-réguliers.
On expose dans cette section la preuve de la convergence
spectrale forte en probabilité de Jöel Friedman dans le cas du modèle de
configuration de graphes aléatoires $d$-réguliers. La preuve se généralise
à une classe plus large de modèles de graphes aléatoires $d$-réguliers,
que Friedman appelle "modèles algébriques".

=== Modèle de configuration
On rappelle la construction de graphes aléatoires à $N in ℕ$ sommets.
On suppose que $N d$ est pair, on se donne $d$ demi-arêtes par sommet,
et on effectue un appariement aléatoire uniforme des $N d$ demi-arêtes.
Le cardinal de l'ensemble des appariements est le produit des nombres impairs jusqu'à $N d - 1$,
noté $(N d - 1)!!$. On a montré que $G_N$ converge presque sûrement au sens de Benjamini-Schramm
vers l'arbre $d$-régulier $T_d$, d'où la convergence des mesures spectrales empiriques
#equation(id: "eqCVSpecFaibleConfig")[
  $
    1/N sum_(i = 0)^(N-1) f(λ_i (G_N)) stretch(arrow)_(N -> ∞)^("p.s.")
    chevron.l δ_(o) mid(|) f(A_(T_d)) δ_(o) chevron.r_(ell^(2)) = integral f(lambda) dif m_(d)(lambda),
  $
]
où $λ_0 > λ_1 ⩾ dots.h.c ⩾ λ_(N-1)$ sont les valeurs propres de l'opérateur d'adjacence de $G_N$
(la probabilité d'être connexe tend vers $1$ quand $N -> ∞$, et où $m_(d)$ est la mesure
absolument continue par rapport à la mesure de Lebesgue donée par
$
  dif m_(d)(λ) = bb(1)_([-2 sqrt(q), 2 sqrt(q)]) d/(2 π) (sqrt(4 q - λ^2)) / (d^2 - λ^2) dif λ,
$
//TODO: faire une figure de la mesure de Kesten-McKay, avec le
//trou spectral entre $2 sqrt(q)$ et $d$.
Le trou spectral de la spectrale de l'arbre $d$-régulier
est l'intervalle $]2 sqrt(q), d[$ (l'existence de ce trou exprime la non-moyennabilité de
$T_d$). La convergence des mesures spectrales empiriques implique que le nombre de valeurs propres
de $G_N$ dans $]2 sqrt(q), d[ ∪ ]-d, -2 sqrt(q)[$ est négligeable devant $N$ quand $N -> ∞$.

On cherche à montrer la convergence spectrale forte en probabilité.
Pour le modèle de configuration, l'énoncé s'écrit
$
  PP_(N)( sp(A_(G_N)) without { λ_(0) } ⊂ [ -2 sqrt(q) - ε, 2 sqrt(q) + ε ] ) stretch(arrow)_(N -> ∞) 1.
$
Il s'agit de la conjecture d'Alon, démontrée pour la première fois par Friedman en 2008 @friedmanProofAlonsSecond2008a.

Si $G = (V, E)$ est un graphe régulier, on définit la matrice de Hashimoto $B$, indexée
par les arêtes orientées de $G$ (donc de taille $N d times N d$), par
$
  B(x -> y, z -> w) = cases(
    1 & "si" z = y "et" w ≠ x,
    0 & "sinon"
  ).
$
Autrement dit, $B$ est la matrice qui engendre les chemins sans retour arrière dans $G$.
Sur chaque ligne et chaque colonne de $B$, il y a exactement $d - 1 = q$ entrées égales à $1$
et le reste des entrées est nul.
Si $A$ désigne la matrice d'adjacence de $G$, de spectre
$
  sp(A) = { λ_0 ⩾ λ_1 ⩾ dots.h.c ⩾ λ_(N-1) },
$
Alors
$
  sp(B) = { q^(1/2 ± i s_(j)) thick;thick 0 ⩽ j < N - 1 } union { 1, -1 },
$
où $s_j in CC$ vérifie
$ λ_(j) = q^(1/2 + i s_(j)) + q^(1/2 - i s_(j)). $
Les valeurs propres $q^(1/2 ± i s_(j))$ apparaissent avec
la même multiplicité que $λ_j$, ce qui donne $2N$ valeurs propres. Les $s_j$
réels correspondent aux valeurs propres $λ_j$ dans l'intervalle $[-2 sqrt(q), 2 sqrt(q)]$,
tandis que les $s_j$ imaginaires purs correspondent aux $λ_(j)$
en dehors de cet intervalle (trou spectral de la limite faible).
Les valeurs propres $1$ et $-1$ apparaissent chacune avec multiplicité
$ N(d-2)/2 = abs(E) - abs(V) = b(G) - 1, $
Où $b(G)$ est appelé rang cyclique de $G$, et est égal au nombre minimal
d'arêtes à supprimer pour obtenir un arbre couvrant de $G$.
Les valeurs propres $1 "et" -1$ sont appelées les valeurs propres topologiques de $B$.
On peut donc reformuler la conjecture d'Alon en termes de valeurs propres de $B$.
//TODO: dessin des vp de $A$ et $B$ sur le plan complexe.

On rappelle que dans ce cours, on appelle géodésique sur un graphe un chemin sans
retour arrière. On a donc
$
  tr(B^k) = sum_(γ) T(γ), //TODO: vérifier
$
où $γ$ parcourt l'ensemble des géodésiques fermées périodiques
de longueur $k$, et $T(γ)$ est la plus petite période de $γ$.
Par ailleurs, en calculant la trace de $B^k$ grâce à ses valeurs propres, on obtient
$
  tr(B^k)/q^(k/2) = sum_(j = 0)^(N-1) ( q^(i k s_(j)) + q^(-i k s_(j)) )
  + (b(G) - 1)/q^(k/2)(1 + (-1)^k).
$
Soit $φ : ZZ --> ℂ$ une fonction paire à support fini. On a
$
  tr(sum_(k > 0) φ(k) B^k / q^(k/2)) =
  sum_(j = 0)^(N-1) hat(φ)(s_(j)) - N φ(0) + (b(G) - 1) sum_(k > 0) φ(k) / q^(k/2)(1 + (-1)^k),
$
où
$
  hat(φ)(s) = sum_(k in ZZ) φ(k) q^(i k s)
$
est périodique de période $(2 π )/ log(q)$. C'est un polynôme
trigonométrique en $s$. Comme $q^(i k s) + q^(-i k s)$ est un polynôme
de degré $k$ en $λ = q^(1/2 + i s) + q^(1/2 - i s)$, on en déduit que
$hat(φ)$ est un polynôme en $λ$ de degré au plus $max(abs(supp(φ)))$.
On obtient la formule des traces

#equation(id: "eqFormuleTraces")[
  $
    1/N sum_(j = 0)^(N-1) hat(φ)(s_(j)) = integral_(RR slash (2 π) / log(q) ZZ) hat(φ)(s) dif m_(d)(s)
    + 1/N sum_(γ) T(γ) / q^(ell(γ)/2) φ(ell(γ))),
  $
]
où $γ$ parcourt l'ensemble des géodésiques fermées périodiques de $G$,
$ell(γ)$ est la période de $γ$ (et $T(γ)$ sa période primitive), et
la meure $m_(d)$ est définie par ses coefficients de Fourier
$
  integral_(RR slash (2 π) / log(q) ZZ) q^(i k s) dif m_(d)(s) = cases(
    1 & "si" k = 0,
    -(d-2)/2 (1 + (-1)^k) / q^(k/2) & "si" k > 0.
  )
$
La mesure $m_(d)$ est la même que celle qui apparaît dans @eqCVSpecFaibleConfig, au changement
de variable près $λ = q^(1/2 + i s) + q^(1/2 - i s)$. Elle est absolument continue
par rapport à la mesure de Lebesgue. Par convergence au sens de Benjamini-Schramm,
le terme de @eqFormuleTraces venant des géodésiques orientées tend vers $0$ quand $N --> ∞$. La mesure
spectrale limite vient donc de la partie topologique de @eqFormuleTraces.

Lorsque $G$ est un graphe aléatoire $G_N$, on cherche à étudier
l'espérance de la partie géodésique de @eqFormuleTraces. Soit $Γ
= (V_(Γ), E_(Γ))$ un graphe à $v$ sommets et $a$ arêtes, de
valence $⩽ d$. Soient
$
  x : V_(Γ) arh {1, ..., N} quad "et" quad t : D_(Γ) arh {1, ..., d}
$
des étiquettes respectives des sommets et demi-arêtes de $Γ$.
On a
$
  PP_(N)( (Γ, x, t) ⊂ G_N ) = (N d - 2a - 1)!! / (N d - 1)!!,
$
en dénombrant les appariements des demi-arêtes qui ne sont pas contraintes
par la présence de $(Γ, x, t)$ dans $G_N$. De là, il vient
$
  EE_(N)[ #block[nombre de réalisations\ étiquetées de $Γ$ dans $G_N$] ] & =
  PP_(N)( (Γ, x, t) ⊂ G_N ) dot hash{ "étiquetages" (x, t) } \
  & = (N d - 2a - 1)!! / (N d - 1)!! dot hash{ "étiquetages" (x, t) }.
$
Pour obtenir le nombre d'étiquetages $(x, t)$, on suppose que $Γ$ n'a pas
de feuille (sommet de valence $1$), et on introduit la forme de $Γ$, notée $F(Γ)$, définie
comme le graphe obtenu en retirant tous les sommets de valence $2$ de $Γ$,
et dont chaque arête $e$ est étiquetée par le nombre $ell_(e)$ de sommets
qui ont été retirés de $Γ$ sur le chemin correspondant à $e$. Maintenant,
il y a $N (N - 1) dots (N - v + 1)$ étiquetages possibles de $V_(Γ)$ dans
${1, ..., N}$, et pour chaque étiquetage des sommets, il y a
$
  C(F(Γ)) times product_(e in E(F(Γ))) (d(d - 1))^(ell_(e) - 1),
$
où $C(F(Γ))$ est le nombre d'étiquetages des arêtes qui partent des sommets de $F(Γ)$.
On obtient finalement l'expression
$
  EE_(N)[ #block[nombre de réalisations\ étiquetées de $Γ$ dans $G_N$] ] & =
  C(F(Γ)) N^(v - a) / d^(a)
  ((1 - 1/N)(1 - 2/N) dots.h.c (1 - (v - 1)/N))/
  ((1 - 1/( d N))(1 - 3/(d N)) dots.h.c (1 - (2 a - 1)/(d N))) (d(d - 1))^(a)\
  & = C(F(Γ)) N^(v - a)
  ((1 - 1/N)(1 - 2/N) dots.h.c (1 - (v - 1)/N))/
  ((1 - 1/( d N))(1 - 3/(d N)) dots.h.c (1 - (2 a - 1)/(d N))) (d - 1)^(a).
$
On obtient une fraction rationnelle en $1/N$. C'est sûrement la justification
de l'appellation "méthode polynomiale" (l'autre preuve que l'on comparera à la
preuve de Friedman). On remarque encore une fois la présence de de l'exposant
$v - a = 1 - b(Γ)$. De plus $v - a = 0$ si et seulement si $Γ$ est un cycle.

On utilisera le résultat suivant pour étudier le comportement asymptotique
de cette fraction rationnelle en $1/N$.

#proposition[
  Posons, pour $p in NN$
  $
    f_(p)(x) = (1-x)(1-2x) dots.h.c (1 - p x), quad "et" quad g_(p)(x) = 1 / f_(p)(x).
  $
  Alors, il existe deux familles de polynômes $(Q_(k))_(k in NN)$
  et $(R_(k))_(k in NN)$ telles que pour tout $p$, les développements de Taylor
  formels de $f_(p)$ et $g_(p)$ en $0$ soient donnés par
  $
    f_(p)(x) & = sum_(k = 0)^(∞) (-1)^(k)x^(k)Q_(k)(p) quad "et" quad
    g_(p)(x) & = sum_(k = 0)^(∞) x^(k) R_(k)(p).
  $
  De plus, pour tous $k, p$, on a les estimations des coefficients de Taylor
  $
    deg(Q_(k)) = deg(R_(k)) = 2 k, quad abs(Q_k (p)), abs(R_k (p)) ⩽ k! p^(2k)
  $
  et du reste tant que $x a^(2)$ est borné
  $
    abs(x^(n+1) tilde(R)_(n+1)(p)) = O(p^(2 (n + 1)) x^(n+1)(n+1)!), quad "avec" quad tilde(R)_(n+1)(p) = sum_(k = n+1)^(∞) x^(k - n - 1) R_(k)(p).
  $
]<propDevTaylorFG>
