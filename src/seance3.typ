#import "@local/mathdoc:0.1.0": *
#import "../lib/lib.typ": *

== Exemples
=== Grille rectangulaire
// TODO: figure
De même que pour le tore discret et la grille carrée, on a
$
  [|0, M|] times [|0, N|] stretch(arrow)_(min(M, N) -> ∞)^("B-S") δ_((ZZ^(2), 0)) .
$

=== Graphes réguliers de grande systole <sec:graphe-grande-systole>
Soit $d ⩾ 2$. On considère une suite de graphes $G_N$ $d$-réguliers.
Si la systole (longueur du plus petit chemin fermé non trivial) de
$G_N$ tend vers l'infini lorsque $N arrow ∞$, alors pour $R > 0$ fixé,
les boules de rayon $R$ dans $G_N$ pour $N$ suffisament grand sont
isomorphes à l'arbre enraciné $d$-régulier. Ainsi, il y a convergence
au sens de Benjamini-Schramm vers l'arbre infini $d$-régulier vu comme
graphe déterministe. Ce graphe étant homogène, le choix de la racine
n'a pas d'importance. On l'écrit
$
  G_N stretch(arrow)_(N -> ∞)^("B-S") δ_((T_d, o)).
$
On peut affaiblir l'hypothèse sur la systole en demandant que pour tout $R > 0$, le
nombre de géodésiques fermées de longueur au plus $R$ (chemins fermés sans retour arrière
dans le graphe) soit négligeable devant la taille de $G_N$. #text(fill: red)[Ne suffit-il
  pas de prendre comme définition de géodésique un chemin fermé sans auto-intersection (implique sans
  retour arrière) ?]

=== Graphes ayant un revêtement universel commun
Soit $tilde(G)$ un arbre, et $Γ < op("Aut")(tilde(G))$ un sous-groupe
agissant librement sur $tilde(G)$, tel que le quotient $tilde(G) slash Γ$
soit fini. Autrement dit, $tilde(G)$ est le revêtement universel d'un graphe fini.
On note $D$ un domaine fondamental de l'action de $Γ$ sur $tilde(G)$ (i.e.
un sous ensemble fini de sommets de $tilde(G)$ dont l'orbite sous $Γ$ forme
un pavage de $tilde(G)$). Soit $(Γ_N)_(N ⩾ 1)$ une suite de sous-groupes
de $Γ$. On note $G_N = tilde(G) slash Γ_N$ le graphe quotient.
//TODO: Il ya des trucs pas clairs (Nalini ne suppose pas que les
//Γ_N sont dans Γ, comment D apparaît-il dans son énoncé ?)

#proposition[
  Si la systole de $G_N$ tend vers l'infini lorsque $N arrow ∞$, alors
  $
    G_N stretch(arrow)_(N -> ∞)^("B-S") 1/abs(D) sum_(x in D)δ_((tilde(G), x)).
  $
]<propCVBSRevUniversal>

#exercise[
  Montrer l'équivalence entre les deux assertions suivantes.
  #ilist[
    + La systole de $G_N$ ne tend pas vers l'infini lorsque $N arrow ∞$.
    + Il existe $x in D$ et une suite d'entiers $(n_i)_(i in NN)$ qui tend vers l'infini,
      des suites
      $
        (γ_(i)) in (Γ_(n_i) without {e})^(NN), quad (g_(i)) in Γ^(NN)
      $
      et $R > 0$ tels que pour tout $i in NN$,
      $
        d(x, g_(i)^(-1)γ_(i) g_(i) x) ⩽ R.
      $
  ]
]

#remark[
  Le cas que l'on rencontre le plus souvent dans la littérature est celui où
  les $Γ_(N)$ forment une suite décroissante de sous-groupes normaux de $Γ$, de
  sorte que $G_(N+1)$ est un revêtement fini de $G_N$. Dans ce cas, la divergence
  de la systole est équivalente à la condition
  $
    inter.big_(N ⩾ 1) Γ_(N) = {e}.
  $
]<rmkCasParticulier>

#exercise[
  Prouver la @propCVBSRevUniversal précédente dans le cas
  particulier de la @rmkCasParticulier.
]

#definition[
  On dit qu'une mesure de probabilité $ν in cal(P)^(1)(GG_(*)^(d))$ est
  unimodulaire si pour toute fonction $f : GG_(**)^(d) --> RR_(+)$ mesurable
  positive sur les graphes de valence au plus $d$ avec deux points marqués
  modulo isomorphisme, on a
  $
    integral_(GG_(*)^(d)) sum_(y in V(G)) f(G, x, y) dif ν(G, x)
    = integral_(GG_(*)^(d)) sum_(x in V(G)) f(G, x, y) dif ν(G, y).
  $
]

Si $G = (V, E) in GG_(*)^(d)$ est un graphe fini, alors la mesure définie à la séance 2
par
$
  ν_(G) = 1/abs(V) sum_(x in V) δ_((G, x))
$
est clairement unimodulaire. De plus, la propriété d'unimodularité est stable par
limite faible. Les limites de suites de graphes finis au sens de Benjamini-Schramm
sont donc toujours unimodulaires.

#proof(title: [Esquisse de démonstration de la @propCVBSRevUniversal (cas général)])[
  On reprend un argument de @bowenCheegerConstantsL2Betti2015, qui fonctionne pour des espaces métriques
  plus généraux que des graphes. //TODO: référence précise
  Si $tilde(G)$ est le revêtement universel d'un graphe fini, alors il existe
  une unique mesure de probabilité $μ in cal(P)^(1)(GG_(*)^(d))$ unimodulaire
  et telle que
  $
    μ { (cal(G), o) mid(|) cal(G) = tilde(G) } = 1,
  $
  et elle est donée par
  $
    μ = 1/abs(D) sum_(x in D) δ_((tilde(G), x)).
  $
  Or, comme la systole de $G_N$ tend vers l'infini, le graphe limite (géométrique)
  d'une valeur d'adhérence de Benjamini-Schramm est nécessairement isomorphe à $tilde(G)$.
  Par unicité de la mesure unimodulaire supportée sur $tilde(G)$, il existe une unique
  telle valeur d'adhérence, ce qui conclut.
]

=== Graphes aléatoires
On étudie la convergence presque sûre au sens de Benjamini-Schramm
/ Graphes $d$-réguliers aléatoires.:
  / Modèle de configuration.: Fixons $d ⩾ 3$ et $N ⩾ 1$ tel que
    $d N$ soit pair. On considère une collection de $N$ sommets,
    chacun ayant $d$ demi-arêtes, //TODO: figure
    et on réalise un appariement entre ces $d N$ demi-arêtes,
    choisi uniformément. On obtient ainsi un graphe aléatoire $G_N$,
    dans lequel il peut y avoir des boucles et des multi-arêtes.
    Étant donné un entier $R$, on note $Y_(R)$ le nombre de géodésiques
    fermées de longueur $R$. Alors, pour tout $k ⩾ 1$, on peut montrer que
    (cf. cours de l'année dernière)
    // TODO: Longueur = R ou au plus R ?
    #equation(id: "eqMomentsFactoriels")[
      $
        EE_(N)[Y_(R)(Y_(R) - 1) ... (Y_(R) - k + 1)] stretch(arrow)_(N -> ∞) λ_(R)^(k), quad
        "avec" λ_(R) = (d - 1)^(R) / (2R).
      $
    ]
    En particulier, les moments $(EE_(N)[Y_R^(k)])_(N in NN)$ forment une suite bornée.
    Pour $k = 2$, l'inégalité de Markov donne
    $
      PP_(N)[Y_R ⩾ α N] ⩽ (EE_(N)[Y_R^(2)])/(α N)^(2), quad "donc" Y_(R) / N stretch(arrow)_(N -> ∞)^("p.s.") 0
    $
    par le lemme de Borel-Cantelli. En appliquant le résultat de la @sec:graphe-grande-systole,
    on en déduit que $G_N$ converge presque sûrement au sens de Benjamini-Schramm vers
    l'arbre infini $d$-régulier
    $
      G_N stretch(arrow)_(N -> ∞)^("p.s. B-S") δ_((T_d, o)).
    $
    La convergence est donc presque-sûrementement déterministe.

  / Modèle de permutations.: Soit $d = 2m$ un entier pair. On se donne $m$
    permutations $σ_1, ..., σ_m in cal(S)_(N)$ indépendantes identiquement
    distribuées de loi uniforme, et on considère le graphe aléatoire $G_N$
    $d$-régulier à $N$ sommets dans lequel les voisins d'un sommet $i in [|1, N|]$
    sont les $σ_j(i)$ et $σ_j^(-1)(i)$ pour $1 ⩽ j ⩽ m$. On peut montrer
    de la même manière que pour tout $R ⩾ 1$, le moment factoriel d'ordre $k$
    du nombre de géodésiques fermées de longueur $R$ converge quand
    $N -> ∞$ vers $λ_(R)^(k)$ (cf. équation @eqMomentsFactoriels), où cette
    fois $ λ_(R) = ((d-1)^(R) + M + (-1)^(R)(M-1))/(2R). $
    On en déduit de la même manière la convergence presque-sûre de $G_N$ au sens de
    Benjamini-Schramm vers l'arbre infini $d$-régulier.

/ Modèle de revêtement aléatoire.: Soit $G$ un graphe fini fixé, et $N ⩾ 1$
  un entier. Fixons également un ordre sur $V$, de sorte que chaque arête
  de $G$ puisse s'écrire de manière unique sous la forme $(x, y)$ avec $x ⩽ y$.
  On se donne une famille $(σ_(x, y))_( (x, y) in E )$ de permutations
  indépendantes identiquement distribuées de loi uniforme sur $cal(S)_(N)$.
  On considère ainsi le graphe $G_N$ dont l'ensemble des sommets est
  $V times [|1, N|]$, et dans lequel $(x, i)$ est relié à $(y, j)$ si et seulement si
  $(x, y) in E$ et $σ_(x, y)(i) = j$. La projection canonique
  $
    G_N --> G, quad cases(
      (x, i) & arrow.r.bar.long x,
      ((x, i), (y,j)) & arrow.r.bar.long (x, y)
    )
  $
  fournit une structure de revêtement aléatoire de degré $N$ de $G$.
  Étant donnée une géodésique fermée $γ = (e_1, ..., e_R)$ dans $G$,
  le relevé de $γ$ dans $G_N$ à partir du sommet $(x, i)$ est à pour
  point d'arrivée le sommet $(x, σ_(γ)(i))$, où
  $
    σ_(γ) = σ_(e_R) compose ... compose σ_(e_1).
  $
  En particulier, le relevé de $γ$ à partir de $(x, i)$ est fermé
  si et seulement si $i$ est un point fixe de $σ_(γ)$. Si l'on suppose
  de plus que la géodésique $γ$ est simple //TODO: définition ?
  alors $σ_(γ)$ suit une loi uniforme sur $cal(S)_(N)$. Si $Y_(γ)$
  désigne le nombre de relevés fermés de $γ$ dans $G_N$, on a donc
  $
    EE_(N)[Y_(γ)] = EE_(N)[hash { i in [|1, N|] mid(|) σ_(γ)(i) = i }]
    = sum_(i=1)^(N) PP_(N)(σ(i) = i) = 1.
  $
  Cela entraîne (exercice) que pour tout $R ⩾ 1$, le nombre $Y_(R)$
  de géodésiques fermées de longueur $R$ dans $G_N$ est borné indépendamment
  de $N$. Il en est de même pour tous les moments de $Y_(R)$. On en déduit
  comme précédemment
  $
    G_N stretch(arrow)_(N -> ∞)^("p.s. B-S") 1/abs(D) sum_(x in D) δ_((tilde(G), x)),
  $
  où $tilde(G)$ est le revêtement universel de $G$ et $D$ un domaine fondamental
  associé au revêtement $tilde(G) --> G$.

=== Graphes d'Erdős-Rényi
On construit dans cette section un exemple où la limite au sens de Benjamini-Schramm
d'une suite de graphes finis est une mesure de probabilité non déterministe dans
laquelle plusieurs graphes distincts apparaissent
(pas seulement des racines différentes d'un même graphe).

Soient $N ⩾ 1$ un entier, et $c in [0, N]$. On considère le graphe aléatoire
$G_(N)$ dont l'ensemble des sommets est $[|1, N|]$, et dans lequel chaque paire
de sommets est reliée par une arête avec probabilité $p = c/N$, de manière indépendante.
On remarque que $c$ est le nombre moyen de voisins d'un sommet dans $G_(N)$.
On a
$
  P_(N)(1 "possède" m "voisins") = binom(N-1, m) (c/N)^(m) (1 - c/N)^(N-1-m)
  stretch(arrow)_(N -> ∞) e^(-c) c^(m) / (m!).
$
Ainsi, la loi des boules de rayon $1$ dans $G_(N)$ converge un loi de Poisson
de paramètre $c$ lorsque $N arrow ∞$. En poursuivant ce raisonnement, on peut
montrer que le graphe $G_(N)$ converge presque sûrement au sens de Benjamini-Schramm
vers un arbre aléatoire de Galton-Watson $T_c$ où le nombre de descendants
de chaque sommet suit une loi de Poisson de paramètre $c$. //TODO: Voir arbres de Galton-Watson.
Le théorème @thCVBSSpectres s'applique et donne
$
  1/N sum_(k=1)^(N) f(λ^((N))_(k)) stretch(arrow)_(N -> ∞)^("p.s.")
  EE_(∞) [chevron.l δ_(o) mid(|) f(A_(T_c)) δ_(o) chevron.r_(ell^(2))],
$
pour toute fonction test $f in RR[X]$. On a également
la convergence spectrale faible analogue pour le laplacien discret.

#remark[
  On peut écrire
  $
    EE_(∞) [chevron.l δ_(o) mid(|) f(A_(T_c)) δ_(o) chevron.r_(ell^(2))]
    = integral f(λ) dif m_(c)(λ).
  $
  La mesure $m_(c)$ n'est pas encore bien comprise pour les arbres de Galton-Watson.
  A partir de quelles valeurs de $c$ possède-t-elle des parties absolument continues ?
  Atomes ?
  //TODO: vérifier que j'écris pas n'importe quoi : quel est le
  //sens de "pour les arbres de GW" ?
]

#definition[
  Avec les notations précédentes, on dit qu'il y a convergence spectrale forte
  si on a convergence spectrale faible et l'une des conditions équivalentes suivantes
  est vérifiée :
  #ilist[
    + Pour tout $f in RR[X]$, on a
      $
        norm(f(A_N))_(L^(2) --> L^(2)) stretch(arrow)_(N -> ∞)^("p.s.")
        sup lr({ abs(f(λ)) thick;thick λ in supp (m_(c)) }) ;
      $
    + Il y a convergence presque-sûre des trous spectraux (voir séance 1) ;
    + Il y a convergence presque-sûre de $sp(A_N)$ vers $supp(m_(c))$ au
      sens de la distance de Hausdorff.
  ]
]<defCVSpectraleForte>

#remark[
  Dans la littérature, la convergence spectrale faible ne fait pas toujours
  partie de la définition de la convergence spectrale forte. Il faut prendre
  garde au fait que les trois conditions de la @defCVSpectraleForte n'impliquent
  pas la convergence spectrale faible. Dans la plupart des exemples précédents,
  la convergence spectrale faible découle de la convergence
  au sens de Benjamini-Schramm.
]

== Convergence de Benjamini-Schramm pour des espaces métriques
On s'intéresse dans cette section à la convergence de suites d'espaces
métriques pointés mesurés. Tous les espaces métriques considérés
seront supposés complets, séparables et propres (i.e. leurs boules fermées
sont compactes).

#definition(title: "EMMP")[
  Un espace métrique pointé mesuré (EMMP) est un quadruplet
  $
    (X, d, x, m),
  $
  où $(X, d)$ est un espace métrique (complet, séparable et propre), 
  $x$ est un point de $X$ et $m$ est une mesure de Radon positive 
  non nulle sur $X$. On demande aux isomorphismes entre EMMP de 
  préserver la métrique, l'origine et la mesure. On note
  $MM_(*)$ l'ensemble des classes d'isomorphisme d'EMMP.
]

#definition[
  Soit $(X_n, d_n, x_n, m_n)_(n in NN)$ une suite d'EMMP.
  On dit que cette suite converge pour la topologie de Gromov-Hausdorff
  pointée mesurée vers un EMMP $(X, d, x, m)$, et l'on note
  $
    (X_n, d_n, x_n, m_n) stretch(arrow)_(n -> ∞)^("pmGH") (X_(∞), d_(∞), x_(∞), m_(∞)),
  $
  s'il existe un espace métrique $(Z, d)$ complet séparable et des injections
  isométriques
  $
    ι_(n) : (X_n, d_n) arh (Z, d), quad n in NN union {∞},
  $
  telles que
  #ilist[
    + $ι_(n)(x_n) stretch(arrow)_(n -> ∞) i_(∞)(x_(∞))$ dans $(Z, d)$ ;

    + $(ι_(n))_(sharp) m_n stretch(harpoon)_(n -> ∞) (ι_(∞))_(sharp) m_(∞),$
      les fonctions test étant prises continues à support borné ;

    + Pour $R, ε > 0$, il existe $N in NN$ tel que pour tout $n ⩾ N$ entier,
      on ait
      $
        ι_(n)(B_(X_n)(x_n, R)) ⊂ scr(V)_(ε) (i_(∞)(X_(∞)))
        quad "et" quad
        ι_(∞)(B_(X_(∞))(x_(∞), R)) ⊂ scr(V)_(ε) (i_(n)(X_n)),
      $
      où $scr(V)_(ε)(Y)$ désigne le $ε$-voisinage de $Y$ dans $(Z, d)$.
  ]

  #definition[
    Soit $(X_n, d_n, m_n)$ une suite d'espaces métriques mesurés (sans origine).
    On suppose que $m_n (X_n) < ∞$ pour tout $n in NN$. Pour tout $n in ℕ$, on
    définit une mesure de probabilité $ν_n in cal(P)^(1)(MM_(*))$ en choisissant
    une origine $x_n in X_n$ aléatoirement selon la mesure normalisée $m_(n)^((1))$.
    Autrement dit,
    $
      ν_n = integral_(X_n) δ_((X_n, d_n, x, m_n)) (dif m_n (x))/m(X_n).
    $
    On dit que la suite $(X_n, d_n, m_n)_(n in NN)$ converge au sens de
    Benjamini-Schramm vers un EMMP $(X, d, x, m)$ si la suite de mesures
    $(ν_n)_(n in NN)$ admet une limite faible $ν in cal(P)^(1)(MM_(*))$
  ]

  #remark[
    Dans la définition précédente, on s'intéresse principalement au cas où
    $m_n (X_n) --> ∞$. Gromov a détaillé des conditions sous lesquelles
    l'image de $X_n$ dans $Z$ reste relativement compacte. En  pratique
    ce sera le cas dans la plupart des exemples que l'on considérera.
  ]

  #example[
    + On considère un tore $TT_(ε, L) := RR slash ε ZZ times RR slash L ZZ$ dans la limite
      $ε -> 0$, $L -> ∞$. On munit $TT_(ε, L)$ de la mesure euclidienne
      $m_(ε, L)$ normalisée de masse totale $L$. On a alors
      $
        TT_(ε, L) stretch(arrow)^("B-S")_(L -> ∞ \ ε -> 0) δ_((RR ,o)).
      $
    + On considère une suite de surfaces hyperboliques compactes $(X_n)$. On
      suppose que le volume de $X_n$ tend vers l'infini et
      que la systole de $X_n$ tend vers l'infini (ou plus généralement
      que le nombre de géodésiques fermées de longueur $⩽ R$ est
      négligeable devant le volume de $X_n$ pour tout $R > 0$ fixé). On munit
      $X_n$ de la mesure volume $m_n$. Alors
      $
        X_n stretch(arrow)_(n -> ∞)^("B-S") δ_((HH^(2), o)),
      $
      où $HH^(2)$ est le plan hyperbolique et $o in HH^(2)$ un point quelconque.
    + *L'exemple des $7$ samouraïs.* Soit $G$ un groupe de Lie semi-simple,
      connexe, de centre trivial et sans facteur compact. Soit $K < G$ un sous-groupe
      compact maximal, et on note $X = G slash K$ l'espace symétrique associé. (Par exemple,
      $G = op("SL")(2, RR)$ et $X ≃ HH^(2)$). Soit $(Γ_n)_(n ⩾ 1)$ une suite de réseaux
      sans torsion dans $G$. On note $X_n = Γ_n slash X$, et $X_(n, R)$ l'ensemble des
      points de $X_n$ dont le rayon d'injectivité est au plus $R > 0$. On suppose que
      pour tout $R > 0$, le volume de $X_(n, R)$ est négligeable devant le volume de $X_n$
      lorsque $n arrow ∞$. Alors
      #equation(id: "eqCVBSEspacesSymetriques")[
        $
        X_n stretch(arrow)_(n -> ∞)^("B-S") δ_((X, o)),
        $
      ]
      où $o in X$ est un point quelconque.
  ]
]

#theorem(title: "ABBGNRS 7 samourais")[//TODO: reférence précise
  On garde les notations du dernier exemple. Si $G$ est de rang $⩾ 2$, vérifie
  la propriété (T) de Kazhdan // TODO: definition ?
  et les $Γ_(n)$ ne sont pas conjugués deux à deux, alors @eqCVBSEspacesSymetriques
  est vérifiée sans l'hypothèse sur les parties à petit rayon d'injectivité.
]
