#import "../lib/lib.typ": *

== Homogénéisation (d'après @bensoussanAsymptoticAnalysisPeriodic2011, @kesavanHomogenizationEllipticEigenvalue1979)
Soit $Ω$ un ouvert borné de $ℝ^d$. On note
$
  L^(ε) = - sum_(1 ⩽ i,j ⩽ d) ∂_i (a_(i,j)(x/ε) ∂_j dot) + a_(0)(x/ε)
$
où les coefficients $a_(i,j), a_0$ sont $ZZ^(d)$-périodiques bornés et
vérifient les hypothèses d'uniforme ellipticité et de positivité:
$
  a_0 ⩾ 0 " et " sum_(i, j)^() a_(i,j)(y) ξ_i ξ_j ⩾ α |ξ|^2 " pour tout " ξ ∈ ℝ^d, y ∈ ℝ^d, "avec" α > 0.
$

#theorem[
  L'opérateur $L^(ε)$ converge vers $L^(0)$ au sens de la résolvante,
  où
  $
    L^(0) = - sum_(1 ⩽ i,j ⩽ d) ∂_i (q_(i,j) ∂_j dot) + b,
  $
  où $b = mu(a_0)$est la moyenne de $a_0$. Voir références pour
  l'expression de $q_(i,j) ≠ mu(a_(i,j))$. //TODO: citer / ecrire la formule
]


#exercise[
  En dimension $1$, on a $L^(ε) : f arrow.r.bar.long (a^(ε) f
    prime)prime$, avec $a^(ε)(x) = a(x/ε)$ et $L^(0) = q f prime.double$ 
    avec $ q = 1/(mu(1/a)). $ Indication. Résoudre
  $(a^(ε)f prime)prime = g$ avec les conditions de dirichlet. La
  convergence au sens de la résolvante dit que si $f^(ε)$ est
  solution de $L^(ε) f^(ε) = g$, alors $f^(ε) arrow f^(0)$ dans
  $L^2(Ω)$, où $f^(0)$ est solution de $L^(0) f^(0) = g$.
]

== Tores discrets
//TODO: figure
Soit $N ∈ ℕ^*$. On note $G_N = (ZZ slash N ZZ)^(2)$ vu comme la grille
dans le tore $T^(2)$, ce qui en fait un graphe $G_N = (V_N, E_N)$.
On considère le laplacien discret $Δ_N : L^(2)(V_N) --> L^(2)(V_N)$
défini par
$
  (Δ_N f)(x) = N^2 sum_(y ∼ x) (f(y) - f(x)) = sum_(y ∼ x) f(y) - 4 f(x),
$
autrement dit, $Δ_(N) = A_(N) - 4 id$, où $A_(N)$ est l'opérateur d'adjacence.
Les fonctions propres de $Δ_N$ sont données par
$
  e_k (x) = exp(2 i π (k dot x)/N), quad x, k ∈ (ZZ slash N ZZ)^(2),
$
et
$
  Δ_N e_k = 4 (sin^2(π k_1 / N) + sin^2(π k_2 / N)) e_k.
$
=== Première limite
On étudie la convergence de $N^(2)Δ_(N)$ lorsque $N arrow ∞$. Cela revient
à diviser les longueurs de la grille par $N$, donc à faire tendre le pas de la grille vers $0$.
L'objet géométrique limite devrait donc être le tore continu $T^(2)$. On a comme
attendu convergence spectrale :
$
  N^(2)4 (sin^2(π k_1 / N) + sin^2(π k_2 / N)) stretch(arrow)_(N -> ∞) 4 π^2 (k_1^2 + k_2^2),
$
qui sont les valeurs propres du laplacien continu $Δ = - (∂_1^2 + ∂_2^2)$ sur $T^(2)$.
Il y a convergence au sens de la résolvante généralisée. Si $z in CC without ℝ$,
$
  norm(ι_(N) (N^(2) Δ_N - z id)^(−1) ι_(N)^(*) - (Δ_(T^(2)) - z id)^(−1))_(L^(2)(T^(2)))
  stretch(arrow)_(N -> ∞) 0,
$
où
$
  ι_(N) : cal(H)_(N) := ell^2(V_N) stretch(arrow.r.hook)_(#h(0.67cm)) cal(H_(∞)) := L^(2)(T^(2))
$
sont les plongements qui à une fonction $f$ sur la grille associent la fonction
constante par morceaux valant $f(i, j)$ sur le carré $[i/N, (i+1)/N) times [j/N, (j + 1)/N)$

=== Seconde limite
On ne renormalise pas le laplacien discret, donc les tores discrets $G_N$ sont de
plus en plus grands lorsque $N arrow ∞$. Il y a convergence des mesures spectrales
empiriques. Par un argument de sommes de Riemann, pour un intervalle $I ⊂ ℝ$, on a
#equation(id: "eqCVToreDiscretZ2")[
  $
    μ_(N)(I) stretch(arrow)_(N -> ∞)
    integral.double_([0,1]^(2)) bb(1)_(I)(4 [sin^2(π x_1) + sin^2(π x_2)]) dif x_1 dif x_2,
  $
]
où $μ_(N)$ est la mesure spectrale empirique de $Δ_N$
$
  μ_(N)(I) = 1/N^(2) hash{k ∈ (ZZ slash N ZZ)^(2) mid(|) 4 (sin^2(π k_1 / N) + sin^2(π k_2 / N)) ∈ I}.
$
Cette limite est un cas particulier de convergence de Benjamini-Schramm
$
  (ZZ slash N ZZ)^(2) stretch(arrow)_(N -> ∞)^("B-S") ZZ^(2).
$
L'équation @eqCVToreDiscretZ2 s'interprète comme
$
  μ_(N) stretch(arrow)_(N -> ∞) lr(chevron.l δ_(0) mid(|) P_(I)(Δ_(ZZ^(2)))δ_(0) chevron.r),
$
où $P_(I)(Δ_(ZZ^(2)))$ est le projecteur spectral sur $I$ du laplacien sur le graphe infini $ZZ^(2)$.

= Convergence au sens de Benjamini-Schramm
* Références :*
- @benjaminiRecurrenceDistributionalLimits2001 pour les graphes avec laplaciens discrets.
  @aldousProcessesUnimodularRandom2007 traite la généralisation à des graphes avec poids sur les arêtes ;
- @abertGrowthL2invariantsSequences2017 pour les suites d'espaces métriques mesurés
  (article des sept samouraïs) ;
- @bowenCheegerConstantsL2Betti2015 pour des suites d'espaces localement symétriques ;
- @anantharamanEmpiricalSpectralMeasures2021 pour des graphes métriques avec conditions de dispersion.

== Convergence de Benjamini-Schramm pour des suites de graphes discrets
Soit $GG_(*)^(d)$ l'ensemble des graphes enracinés de degré au plus $d$ modulo isomorphismes
préservant la racine. On munit $GG_(*)^(d)$ de la distance définie par
$
  op("dist")((G,x), (G prime, x prime)) ⩽ ε quad <==> quad B_(G)(x, 1/ε) ≃ B_(G^(prime))(x prime, 1/ε),
$
où l'isomorphisme entre les boules est un isomorphisme de graphes préservant la racine.
Alors $(GG_(*)^(d), op("dist"))$ est un espace métrique compact. Notons maintenant
$cal(P)^(1)(GG_(*)^(d))$ l'ensemble des mesures de probabilité sur $GG_(*)^(d)$,
muni de la topologie faible. //TODO: comprendre
Étant donné un graphe fini $G = (V, E)$ de degré au plus $d$, on peut définir une
mesure de probabilité $ν_(G) ∈ cal(P)^(1)(GG_(*)^(d))$ en choisissant une racine de
manière uniforme dans $V$. Autrement dit,
$
  ν_(G) = 1/abs(V) sum_(x ∈ V) δ_( (G, x) ).
$

#definition[
  Soit $(G_N)_(N ⩾ 1)$ une suite de graphes finis de degré au plus $d$. On dit que
  la suite $(G_N)$ converge au sens de Benjamini-Schramm (ou converge localement faiblement)
  si la suite de mesures $(ν_(G_N))$ possède une limite faible $PP_(∞) in cal(P)^(1)(GG_(*)^(d))$.
]<defCVBS>

La mesure limite $PP_(∞)$, si elle existe, est la statistique limite de
la proportion de sommets $x in V_(N)$ tels que la boule de centre $x$ et de rayon $R$ dans $G_N$ est
isomorphe à la boule de centre $y$ et de rayon $R$ dans $H$, pour chaque graphe $(H, y) in
GG_(*)^(d)$ et chaque $R ⩾ 0$.

#remark[
  - On a en tête essentiallement des suites de graphes dont le nombre de sommets tend vers l'infini.
  - $PP_(∞)$ est une mesure de probabilité sur $GG_(*)^(d)$, donc on peut voir l'objet limite comme
    un graphe enraciné aléatoire de loi $PP_(∞)$.
]

#theorem[
  Soit $(G_N)_(N ⩾ 1)$ une suite de graphes finis de degré au plus $d$ qui converge
  au sens de Benjamini-Schramm vers une mesure $PP_(∞) in cal(P)^(1)(GG_(*)^(d))$.
  Notons $(λ^((N))_(k))_(1 ⩽ k ⩽ N)$ les valeurs propres de la matrice d'adjacence
  de $G_N$. Alors celles-ci sont contenues dans $[−d, d]$, et pour toute fonction
  test $f in scr(C)^(0)(ℝ)$,
  $
    1/abs(V_(N)) sum_(k=1)^(abs(V_(N))) f(λ^((N))_(k)) stretch(arrow)_(N -> ∞)
    EE_(∞)lr([chevron.l δ_(o) mid(|) f(A_(cal(G))) δ_(o) chevron.r]),
  $
  où $cal(G)$ dénote un graphe aléatoire de loi $PP_(∞)$, $o$ sa racine,
  $A_(cal(G))$ sa matrice d'adjacence, $EE_(∞)$ l'espérance par rapport à $PP_(∞)$ et
  $δ_(o)$ la masse de Dirac en l'origine $o$.
]<thCVBSSpectres>

#remark[
  - L'opérateur $A_(cal(G))$ est auto-adjoint, donc on peut lui appliquer le
    calcul fonctionnel, ce qui assure que $f(A_(cal(G)))$ est correctement défini.
  //TODO: calcul fonctionnel ?
  - On a un énoncé analogue pour le laplacien discret $Δ = A - d id$ au lieu
    de la matrice d'adjacence.
]

#example(title: "Tores discrets")[
  //TODO: figure
  + La suite des tores discrets $(G_N = (ZZ slash N ZZ)^(2))_(N ⩾ 1)$ converge au
    sens de Benjamini-Schramm vers le graphe infini $ZZ^(2)$ muni de la mesure de Dirac
    en l'origine. En effet, pour tout $R ⩾ 0$, pour $N$ suffisamment grand,
    les boules de rayon $R$ dans $G_N$ sont isomorphes à la boule de rayon $R$ et centrée
    en l'origine dans $ZZ^(2)$. Comme la taille de $G_N$ est $N^(2)$, on en déduit que
    $
      ν_(G_N) stretch(harpoon)_(N -> ∞) δ_( (ZZ^(2), 0) ).
    $
    Ainsi, $G_N$ converge au sens de Benjamini-Schramm vers le graphe déterministe $ZZ^(2)$.
    Le théorème @thCVBSSpectres s'applique, et on retrouve la convergence des mesures spectrales
    empiriques $μ_(N)$ vers la mesure spectrale de $Δ_(ZZ^(2))$ en $0$.
  + Si l'on remplace le tore discret par un carre discret $C_N = {0, ..., N-1}^(2)$,
    avec conditions de Dirichlet ou Neumann sur le bord, il y a également convergence
    au sens de Benjamini-Schramm vers le même graphe déterministe $ZZ^(2)$. En effet,
    le nombre de sommets pour lesquels la boule de rayon $R$ dans le carré n'est
    isomorphe à la boule de rayon $R$ dans $ZZ^(2)$ est majoré par $4 R N$, négligeable
    devant le nombre total de sommets $N^(2)$.
]

#proof(title: [Démonstration du @thCVBSSpectres])[
  Comme les valeurs propres de la matrice d'adjacence de $G_N$ sont dans $[−d, d]$,
  il suffit de montrer la convergence pour des fonctions tests $f$ polynomiales par densité.
  Soit $f$ le monôme de degré $R ⩾ 0$. On a
  #equation(id: "eqTraceChemins")[
    $
      1/abs(V_(N)) sum_(k=1)^(abs(V_(N))) f(λ^((N))_(k))
      = 1/abs(V_(N)) op("Tr")(A_(G_N)^R)
      = 1/abs(V_(N)) sum_(x ∈ V_(N)) A_(G_N)^(R)(x, x).
    $
  ]
  Prenons
  $
    φ : GG_(*)^(d) --> RR, quad (G, x) arrow.r.bar.long A^(R)_(G)(x, x),
  $
  où $A_(G)$ est la matrice d'adjacence de $G$. La fonction $φ$ compte le nombre de
  de lacets en $x$ de longueur $R$ dans $G$, donc $φ(G, x)$ ne dépend que de la
  boule $B_(G)(x, R/2)$, ce qui montre que $φ$ est continue. Par définition de la
  convergence de Benjamini-Schramm, on a
  $
    1/abs(V_(N)) sum_(x ∈ V_(N)) φ(G_N, x) stretch(arrow)_(N -> ∞) integral_(GG_(*)^(d)) φ dif PP_(∞) 
    = EE_(∞)[φ(cal(G), o)]
    = EE_(∞)[chevron.l δ_(o) mid(|) A_(cal(G))^(R) δ_(o) chevron.r].
  $
  Comme $f(A_(cal(G))) = A_(G)^(R)$, l'équation @eqTraceChemins conclut.
]

La prochaine fois. Exemples pour des graphes discrets.
- Graphes réguliers (aléatoires ou déterministes).
- Graphes d'Erdös-Rényi, pour lesquels la limite n'est pas déterministe.
- Espaces métriques plus généraux (article des 7 samouraïs).
