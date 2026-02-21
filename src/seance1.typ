#import "../lib/lib.typ": *

= Notions de convergences géométriques et spectrales

Dans ces deux premières séances, nous posons la question générale
de savoir comparer des objets géométriques et le spectre de leurs
laplaciens. Cela demande d'introduire diverses topologies,
permettant de dire quand et de quelle manière deux objets peuvent
"se ressembler", ainsi que de mesurer la "distance" entre les
spectres. On parcourra une liste non exhaustive d'exemples tirés
de la littérature récente, dans divers domaines des
mathématiques.

On parlera dans ce cours de spectres d'opérateurs auto-adjoints, donc
réels. Le plus souvent, il s'agira du Laplacien $Δ$.

== Le rectangle
On considère $R_(ε)$ le rectangle de dimensions $1 × ε$, muni du laplacien
usuel $Δ_(ε)$. // TODO: Def précise du laplacien ?
// TODO: Comment résoudre l'EDP $Δ f = λ f$ ? Séparation des
// variables ?
- Avec conditions de Dirichlet (fonctions s'annulant sur le bord),
  les fonctions propres et le spectre sont
  $
    sin(k π x) sin(m π y / ε),
    quad quad
    sp(-Δ_(ε)) = { (k π)^(2) + (m π / ε)^(2) mid(|) k, m ∈ ℕ^* }.
  $
  en particulier, le premier, le spectre part à l'infini quand
  $ε$ tend vers $0$.
- Avec les conditions de Neumann (dérivée normale nulle sur le bord),
  on obtient
  $
    cos(k π x) cos(m π y / ε),
    quad quad
    sp(-Δ_(ε)) = { (k π)^(2) + (m π / ε)^(2) mid(|) k, m ∈ ℕ }.
  $
  Il y a donc une partie du spectre qui ne dépend pas de $ε$ ($m = 0$).
  C'est le spectre du laplacien $Δ$ sur le segment $[0, 1]$ avec les conditions
  de Neumann aux extrémités. On a donc une convergence spectrale partielle
  au sens suivant : pour tout $M > 0$ réel, on a pour $ε$ assez petit
  $
    sp(-Δ_(ε)) ∩ [-M, M] = sp(-Δ) ∩ [-M, M]
  $
- Avec des conditions périodiques (le rectangle est vu comme un tore
  $S^(1) times ε S^(1)$), l'objet limite "est" le cercle $S^(1)$, et
  l'on voit que le spectre de $-Δ_(ε)$ converge vers celui de $-Δ$ sur
  $S^(1)$ lorsque $ε$ tend vers $0$, toujours en prenant l'intersection
  avec $[-M, M]$.
//TODO: Exercice : déterminer les fonctions et le spectre dans
//ce cas pour vérifier cette assertion.

#exercise[
  Calculer les fonctions propres et le spectre du laplacien sur
  le tore $S^(1) times ε S^(1)$, et vérifier la convergence spectrale
  partielle vers le spectre du cercle $S^(1)$ lorsque $ε$ tend vers $0$.
]

== Le cône d'angle $α$
On considère le cône $C_(α)$ défini comme le secteur d'angle $2 π α$ et
de rayon $1$ dans le plan, avec les bords $θ in {0, 2 π alpha}$ identifiés
$
  C_(α) := { (r cos θ, r sin θ) mid(|) (r, θ) in [0, 1] times [0, 2 π α]}
  slash ((r, 0) ~ (r cos (2 π α), r sin(2 π α))).
$
// TODO: figure

Le laplacien usuel $Δ$ défini sur les fonctions lisses à support
compact de $C_(α) without {0}$ n'est pas essentiellement auto-adjoint. //TODO: sens ?
On a besoin de choisir des conditions aux limites. On choisit ici les conditions
de Neumann (dérivée normale nulle sur le bord $r = 1$) et existence d'une limite finie
en $0$. On vérifie que ces conditions reviennent à la définition suivante du laplacien
via l'énergie de Dirichlet
$
  E(f, g) = integral_(C_(α)) chevron.l ∇f, ∇g chevron.r r dif r dif θ, quad dom(E) = { f mid(|) nabla f in L^(2)(C_(α)) }.
$
L'opérateur associé $Δ$ est défini par la formule $chevron.l Δ f, g chevron.r_(L^(2)) = E(f, g)$. Son domaine
est $ dom Δ = { f mid(|) g in dom E arrow.r.bar.long E(f, g) in RR "est une forme linéaire bornée" } $

#exercise[
  Vérifier que cette définition a bien les propriétés annoncées. Montrer qu'on a des fonctions propres
  de la forme
  $
    J_(m/α)(sqrt(λ) r) exp(i m θ / α), quad m in ℤ,
  $
  où $J_ν$ est la fonction de Bessel d'ordre $ν$. Pour $m ≠ 0$, le spectre part à l'infini lorsque
  $α$ tend vers $0$. Pour $m = 0$, on obtient des fonctions propres radiales dont le spectre converge
  vers le spectre associé à la forme quadratique (énergie de Dirichlet)
  $
    E^((1))(f, g) = integral_(0)^(1) (partial f) / (partial r) (partial g) / (partial r) r dif r,
  $
  ce qui correspond au laplacien $1$-dimensionnel
  $ Δ^((1)) = partial^(2) / (partial r^(2)) + 1/r partial /(partial r), $
  avec conditions de Neumann en $r = 1$ et limite finie en $0$.
]

Ainsi, l'objet géométrique limite est, comme attendu, l'intervalle $[0, 1]$, mais pas l'opérateur limite.
Il y a une subtilité liée à la convergence des mesures.

== Notions de convergence de spectres (d'après @beckusContinuitySpectrumField2016)
On s'intéresse aux spectres en tant que sous ensembles fermés de $RR$. On oublie
donc les fonctions propres, mesures spectrales et multiplicités. //TODO: mesure spectrale ?

Soit $(cal(H)_(t))_(t in T)$ une famille d'espaces de Hilbert indexée par un espace topologique $T$ (par exemple
$T = NN ∪ {∞}$ pour des suites). Soit $(A_(t))_(t in T)$ une famille d'opérateurs auto-adjoints de spectres $F_(t)$
qui sont des sous-ensembles fermés de $RR$. On fixe $t_0 in T$ et on s'intéresse à la convergence de $F_(t)$ vers $F_(t_0)$
lorsque $t$ tend vers $t_0$.

=== Convergence de Hausdorff
//TODO: définir la distance de Hausdorff
#definition[
  On dit que $F_(t)$ converge vers $F_(t_0)$ au sens de Hausdorff si pour tout
  $ε > 0$ réel, il existe un voisinage $U$ de $t_0$ tel que pour tout $t in U$,
  on a les inclusions
  $
    F_(t) ⊂ F_(t_0) + B(0, ε), quad quad F_(t_0) ⊂ F_(t) + B(0, ε),
  $
  où $B(0, ε)$ est la boule ouverte de centre $0$ et de rayon $ε$ dans $RR$.
]

=== Convergence de Vietoris

#definition[
  On dit que $F_(t)$ converge vers $F_(t_0)$ au sens de la convergence de
  Vietoris si pour tout fermé $K ⊂ RR$ tel que $K ∩ F_(t_0) = ∅$ et tout ouvert $O ⊂ RR$ tel que
  $O ∩ F_(t_0) ≠ ∅$, il existe un voisinage
  $U$ de $t_0$ tel que pour tout $t in U$, on a $K ∩ F_(t) = ∅$, et $O ∩ F_(t) ≠ ∅$.
]

=== Convergence de Fell
#definition[
  On dit que $F_(t)$ converge vers $F_(t_0)$ au sens de la convergence de Fell
  si pour tout compact $K ⊂ RR$ tel que $K ∩ F_(t_0) = ∅$ et tout ouvert
  $O ⊂ RR$ tel que  $O ∩ F_(t_0) ≠ ∅$, il existe un voisinage
  $U$ de $t_0$ tel que pour tout $t in U$, on a $K ∩ F_(t) = ∅$, et $O ∩ F_(t) ≠ ∅$.
]

La convergence au sens de Fell est donc plus faible que la convergence au sens de Vietoris.
Dans les exemples précédents, il y avait convergence au sens de Fell, mais pas au sens de
Vietoris, à cause de la divergence de certaines parties du spectre vers l'infini.

=== Convergence des trous spectraux
On rappelle qu'un ouvert de $RR$ est une réunion dénombrable d'intervalles ouverts disjoints, qui
sont ses composantes connexes.

#definition(title: "Trou spectral")[
  Un trou spectral d'un fermé $F ⊂ RR$ est une composante connexe de $RR without F$.
]

Il existe une notion de convergence des trous spectraux @beckusContinuitySpectrumField2016[Definition 7].
Il est utile en physique de connaitre les bandes interdites (trous spectraux) d'un spectre.

#theorem(title: "Beckus-Bellissard")[
  Supposons que les $A_t$ sont tous des opérateurs auto-adjoints bornés (y compris $A_(t_0)$). Les spectres
  sont donc des compacts de $RR$. Alors les propriétés suivantes sont équivalentes.
  #ilist[
    + $F_t -> F_(t_0)$ au sens des trous spectraux ;
    + $F_t -> F_(t_0)$ au sens de Vietoris ;
    + Il y a convergence des normes d'opérateurs : $norm(P(A_t)) -->_(t -> t_0) norm(P(A_(t_0)))$
      pour tout polynôme $P$ de degré au plus $2$.
  ]
]

#theorem[
  Dans le cas général des opérateurs non nécessairement bornés, on a les équivalences suivantes.
  #ilist[
    + $F_t -> F_(t_0)$ au sens des trous spectraux ;
    + $F_t -> F_(t_0)$ au sens de Fell ;
    + Il y a convergence des normes des résolvantes :
      $ ∀ z in CC without RR, quad norm((z - A_t)^(-1)) -->_(t -> t_0) norm((z -A_(t_0))^(-1)). $
  ]
]

#remark[
  Les différents opérateurs vivent sur des espaces de Hilbert différents. Il est donc
  difficile de comparer directement les opérateurs ou leurs vecteurs propres.
]

== Graphes métriques épaissis (d'après @exnerConvergenceSpectraGraphlike2005)
On considère un graphe métrique fini $G = (V, E)$. Chaque arête $e in E$ est
associée à un intervalle $I_e = [0, L_e]$ de longueur $L_e > 0$. On met le laplacien
usuel $Δ = ∂ / (∂ x^(2))$ sur chaque arête. Il y a plusieurs extensions auto-adjointes possibles. Il
y a un chois de conditions aux limites aux sommets à effectuer. On s'intéresse
ici aux conditions de Kirchhoff : une fonction $f$ est dans le domaine de $Δ$ si
- $f$ est continue aux sommets ;
- la somme des dérivées sortantes de $f$ en chaque sommet est nulle
  $
    sum_(e "incidente à" v) f prime(v) = 0.
  $

Cela revient à prendre l'énergie de Dirichlet
$
  E(f, g) = sum_(e in E) integral_(0)^(L_e) f prime g prime dif x_e,
$
avec $f, g in H^(1)(I_e)$ pour chaque arête $e$, et coninues aux sommets.
Supposons que $G$ soit plongé de manière isométrique dans $RR^(n)$.
On considère $G_(ε)$ un voisinage de taille $ε$ de $G$ dans $RR^(n)$.
On munit $G_(ε)$ du laplacien usuel $Δ_(ε)$ avec conditions de Neumann.

Comme $G$ est fini, le spectre de $-Δ_(ε)$ est discret.

#theorem[
  Lorsque $ε$ tend vers $0$, $λ_(k)^((ε)) --> λ_(k)$, où $λ_(k)^((ε))$ est la
  $k$-ième valeur propre de $-Δ_(ε)$ et $λ_(k)$ la $k$-ième valeur propre de
  $-Δ$ sur le graphe métrique $G$. Il y a de plus convergence en norme des résolvantes
  au sens de la définition suivante.
]

#definition[
  Soient $(A_(ε))_(ε ⩾ 0)$ une famille d'opérateurs auto-adjoints définis
  sur un même espace de Hilbert $cal(H)$. On dit qu'il y a convergence en norme
  des résolvantes de $A_(ε)$ vers celles de $A_(0)$, et on note $A_(ε) -->^("rés") A_(0)$
  si pour tout $z in CC without RR$, on a
  $
    norm((z - A_(ε))^(-1) - (z - A_(0))^(-1)) -->_(ε -> 0) 0.
  $
]

#remark[
  Grâce à l'identité de la résolvante, //TODO: écrire l'identité
  il suffit de vérifier la convergence pour un seul $z in CC without RR$.
]

Soit $Λ ⊂ sp(A_0)$ et $Γ$ un lacet dans $ℂ$ qui entoure $Λ$, c'est à dire
que l'intersection de la composante connexe bornée de $ℂ without Γ$ avec le
spectre de $A_0$ est exactement $Λ$. //TODO: figure
Le projecteur spectral sur $Λ$ s'écrit
alors
$
  P_(ε)^(Λ) = 1/(2 i π) integral_Γ (z - A_(ε))^(-1) dif z.
$
Le théorème de convergence en norme des résolvantes implique alors
la convergence en norme des projecteurs spectraux
$
  norm(P_(ε)^(Λ) - P_(0)^(Λ)) -->_(ε -> 0) 0.
$

Pour le cas des graphes métriques épaissis, on a besoin de généraliser
la notion de convergence en norme des résolvantes à des opérateurs
définis sur des espaces de Hilbert différents.

#definition(title: "Weidmann")[
  On dit que $(A_(ε))_(ε ⩾ 0)$ converge au sens des résolvantes généralisées
  vers $A_(0)$ s'il existe des plongements isométriques
  $
    ι_(ε) : cal(H)_(ε) arrowHookLong cal(H), quad ε ⩾ 0, quad ι_(ε)^(*) ι_(ε) = id
  $
  tels que pour tout $z in CC without RR$, on ait
  $
    norm(ι_(ε) (z - A_(ε))^(-1) ι_(ε)^(*) - ι_(0) (z - A_(0))^(-1) ι_(0)^(*)) -->_(ε -> 0) 0,
  $
  où la norme est celle des opérateurs bornés sur $cal(H)$.
]

#remark[
  Cette convergence des pseudo-résolvantes peut être vérifiée
  pour un seul $z in CC without RR$.
]

#exercise[
  On considère $cal(H)_epsilon = L^2 (RR slash ZZ times (RR slash epsilon ZZ))$, $A_epsilon = Delta_epsilon$ le laplacien sur le tore
  $RR slash ZZ times (RR slash epsilon ZZ)$ (de domaine l'espace de Sobolev $H^2$) et $cal(H)_0 = L^2 (RR slash ZZ)$,
  $A_0 = Delta_0$ le laplacien sur le cercle $RR slash ZZ$. Montrer que $A_epsilon$ converge vers $A_0$
  quand $epsilon --> 0$ en norme de la résolvante (au sens généralisé de Weidmann).
]<exoLaplacienContinuWeidmann>

#proof(title: "Solution")[
  Notons $TT_(epsilon) = RR slash ZZ times (RR slash epsilon ZZ)$ pour $epsilon > 0$
  et $SS^(1) = RR slash ZZ$.
  + Étudions rapidement les opérateurs laplacien. On note,
    pour $epsilon > 0$ et $k, l in ZZ$,
    $
      e_(k, l)^((epsilon)) (x, y) := exp(2 i pi (k x + l y slash epsilon)),
    $
    ce qui définit une base de Hilbert (non normalisée) de $cal(H)_epsilon$ d'après la théorie
    des séries de Fourier. On a
    $
      A_(epsilon) e_(k, l)^((epsilon)) = lambda_(k,l)^((epsilon)) e_(k, l)^((epsilon)), quad "avec" quad lambda_(k,l)^((epsilon)) = - 4 pi^2 (k^2 + l^2 slash epsilon^2).
    $
    Cela montre à la fois que $A_(epsilon)$ est à symétrie hermitienne,
    et qu'il est auto-adjoint sur son domaine maximal, qui n'est autre que
    $H^(2)(TT_(epsilon))$. De plus, les valeurs propres $lambda_(k,l)^((epsilon))$
    tendent vers l'infini lorsque $(k, l) -> infinity$ dans $ZZ^(2)$,
    donc tout $z in CC$ distinct de chaque $lambda_(k,l)^((epsilon))$ est
    résolvant. Ainsi,
    $
      sigma(A_(epsilon)) = { lambda_(k,l)^((epsilon)) thick ; thick (k, l) in ZZ^(2) }.
    $
    On montrerait de manière similaire que $A_0$ est auto-adjoint de
    domaine $H^2 (SS^(1))$, diagonal dans la base de Hilbert (non normalisée)
    $
      e_k (x) := exp(2 i pi k x), quad k in ZZ,
    $
    et de spectre
    $
      sigma(A_0) = { lambda_k thick ; thick k in ZZ } quad "avec" quad lambda_k = - 4 pi^2 k^2.
    $
    On voit que pour $l eq.not 0$, $lambda_(k,l)^((epsilon))$ tend vers l'infini lorsque $epsilon --> 0$.
    Ainsi, on vérifie facilement à la main dans cet exemple que
    le spectre de $A_(epsilon)$ "converge" vers celui de $A_0$. Montrons
    qu'il y a effectivement convergence de $A_(epsilon)$ vers $A_0$ au
    sens de Weidmann.

  + Définissons des plongements des $cal(H)_(epsilon)$ dans un
    espace de Hilbert auxiliaire $cal(H)$. On considère
    $cal(H) = L^(2)(TT)$, avec $TT = TT_(1)$ le tore usuel.
    On écrira $e_(k,l) := e_(k,l)^((1))$ et $lambda_(k,l) := lambda_(k,l)^((1))$
    pour alléger les notations.
    On définit des applications linéaires $iota_(epsilon) : cal(H)_(epsilon) --> cal(H)$ par
    $
      forall epsilon > 0, quad
      iota_(epsilon) f (x, y) = sqrt(epsilon) f(x, epsilon y)
      quad "et" quad iota_0 f (x, y) = f(x).
    $
    On a, pour tout $f in cal(H)_(epsilon) = L^(2)(TT_(epsilon))$,
    $
      norm(iota_(epsilon) f)_(cal(H))^2
      = integral_([0, 1]^(2)) abs(f(x, epsilon y))^2 dif x (epsilon dif y)
      = integral_([0, 1] times [0, epsilon]) abs(f(x, y))^2 dif x dif y
      = norm(f)_(cal(H)_(epsilon))^2,
    $
    ce qui montre que $iota_(epsilon)$ est une isométrie. De même, $iota_0$
    est une isométrie de $cal(H)_0$ dans $cal(H)$. On observe
    que $iota_(epsilon)$ est bijective pour $epsilon > 0$ donc
    $iota_(epsilon)^(*) = iota_(epsilon)^(-1)$. De plus,
    pour $f in cal(H)_(0)$ et $g in cal(H)$, on a par le théorème de Fubini
    $
      chevron.l iota_0 f, g chevron.r_(cal(H))
      & = integral_([0, 1]^(2)) f(x) overline(g(x, y)) dif x dif y
      & = integral_0^1 f(x) overline((integral_0^1 g(x, y) dif y)) dif x
      & = lr(chevron.l f, iota_0^(*)g chevron.r)_(cal(H)_0),
    $
    avec
    $
      iota_0^(*) g (x) = integral_0^1 g(x, y) dif y.
    $

  + Montrons à présent que la convergence en norme des résolvantes au sens de Weidmann a lieu pour
    ces choix de plongements et pour $z = i in CC without RR$. Pour commencer, on a les égalités suivantes,
    valables pour tous $k, l in ZZ$ et $epsilon > 0$.
    $
      iota_(epsilon) e_(k,l)^((epsilon)) = sqrt(epsilon) e_(k,l),
      quad iota_(epsilon)^(*) e_(k, l) = e_(k, l)^((epsilon)) / sqrt(epsilon),
      quad iota_0 e_k = e_(k,0),
    $
    et pour tout $x in SS^(1)$,
    $
      iota_(0)^(*) e_(k, l) (x) = integral_0^1 e_(k, l) (x, y) dif y
      = integral_0^1 exp(2 i pi (k x + l y)) dif y
      = cases(
        e_(k)(x) & quad "si" l = 0,
        0 & quad "si" l eq.not 0.
      )
    $
    De plus,
    $
      R_(epsilon) (z) e_(k, l)^((epsilon)) = e_(k, l)^((epsilon)) / (z - lambda_(k,l)^((epsilon)))
      quad "et" quad
      R_0 (z) e_k = e_k / (z - lambda_k).
    $
    De là, il vient
    $
      (tilde(R)_(epsilon)(z) - tilde(R)_0 (z)) e_(k, l) = a_(k,l)^((epsilon)) e_(k, l), quad "avec" quad
      a_(k,l)^((epsilon)) = cases(
        1 / (z - lambda_(k,l)^((epsilon))) - 1 / (z - lambda_k) = 0 & quad "si" l = 0,
        1 / (z - lambda_(k,l)^((epsilon))) & quad "si" l eq.not 0.
      )
    $
    Or, on a
    $
      abs(a_(k,l)^((epsilon))) lt.eq.slant 1/abs(z - lambda_(k,l)^((epsilon)))
      = 1/ sqrt(1 + 16 pi^4 (k^2 + l^2 / epsilon^2)^2) lt.eq.slant epsilon^(2)/ (4 pi^2).
    $
    Comme les $e_(k,l)$ forment une base de Hilbert de $cal(H)$ et les opérateurs
    $tilde(R)_(epsilon)(z) - tilde(R)_0 (z)$ sont bornés, on en déduit que pour tout $epsilon gt.eq.slant 0$,
    $
      norm(tilde(R)_(epsilon)(z) - tilde(R)_0 (z))_(cal(B)(cal(H))) lt.eq.slant epsilon^(2) / (4 pi^2) stretch(arrow)_(epsilon -> 0) 0,
    $
    ce qui conclut.
]

== Convergence d'espaces métriques au sens de Gromov-Hausdorff.
*Références :* @fukayaCollapsingRiemannianManifolds1987, @cheegerStructureSpacesRicci2000,
@lottRicciCurvatureMetricmeasure2009, @sturmGeometryMetricMeasure2006@sturmGeometryMetricMeasure2006a, @gigliGiorgiGromovWorking2023

On considère dans cette section des espaces métriques pointés mesurés, c'est à dire
des quadruplets $(X, x, d, m)$ tels que
$(X, d)$ est complet séparable, et $m$ une mesure de Radon sur $X$ dont
le support contient $x$.

#definition[
  On note $(X_n, x_n, d_n, m_n) -->^("GH") (X_(∞), x_(∞), d_(∞), m_(∞))$
  et on dit que les espaces métriques pointés mesurés convergent
  au sens de Gromov-Hausdorff s'il existe des injections isométriques
  $
    ι_n : (X_n, d_n) arrow.r.hook (Z, d), quad n in ℕ ∪ {∞}
  $
  avec $(Z, d)$ un espace métrique complet séparable telles qu'on ait la
  convergence faible
  $ (ι_n)_(sharp) m_n stretch(harpoon)_(n -> ∞) (ι_(∞))_(sharp) m_(∞), $
  définie par
  $
    integral_(X_n) φ compose ι_n dif m_n stretch(arrow)_(n -> ∞) integral_(X_(∞)) φ compose ι_(∞) dif m_(∞)
  $
  pour toute fonction test $φ$ continue à support borné sur $Z$.
]

// #remark[
//   Ceci implique $ι_n(x_n) --> ι_(∞)(x_(∞))$ puisqu'on demande aux points
//   de base de faire partie du support des mesures. De plus
//   on a convergence pour la topologie de Hausdorff pointée
//   sur les bornés
//   $
//     ι_n (supp m_n, x_n) --> ι_(∞)(supp m_(∞), x_(∞)).
//   $
// ]


Intéressons-nous au cas où les espaces métriques $(X_n, x_n, d_n, m_n)$
sont des variétés riemanniennes de dimension fixée $N$, de courbures de Ricci
uniformément minorées par $K in RR$, où les distances $d_n$ sont les distances
riemanniennes, et les mesures $m_n$ les mesures de Riemann renormalisées
de sorte que $m_n (B(x_n, 1)) = 1$ pour tout $n$.

#remark[
  - La renormalisation des mesures est par exemple nécessaire pour
    que l'exemple du tore de rayon $ε$ converge vers le cercle. Sans renormalisation,
    la mesure limite serait nulle.
  - L'objet géométrique limite peut ne pas être une variété. Par exemple, on peut
    obtenir un cône comme limite de variétés lisses. En revanche, on peut montrer
    qu'il existe un ensemble $R$, appelé ensemble régulier tel que
    - $R$ est de mesure pleine : $m_(∞)(X_(∞) without R) = 0$.
    - Tout point de $R$ admet un voisinage bi-lipschitzien à un ouvert de $RR^(k)$
      pour un certain $k ⩽ N$ (la dimension peut diminuer dans la limite).
    - La mesure $m_(∞)$ est absolument continue par rapport à la mesure de
      Hausdorff de dimension $k$. //TODO: définition ?
    - L'espace, $X_(∞)$ satisfait une condition $CD(K, N)$ portant sur
      la courburce synthétique, qui ne nécessite pas de structure lisse. Voir
      Lott-Villani, Sturm.
    - Il reste un laplacien à la limite. On note $RCD(K, N)$ ces deux conditions
      réunies (Riemannian Curvature Dimension).
  - L'idée pour définir le laplacien sur l'espace limite est d'utiliser
    les cartes locales bi-lipschitziennes et la comparabilité des mesures
    pour obtenir la différentiabilité presque partout des fonctions lipschitziennes
    sur $X_(∞)$, ce qui permet de définir une énergie de Dirichlet
    $
      E(f, g) = integral_(X_(∞)) chevron.l ∇f, ∇g chevron.r dif m_(∞),
    $
    de domaine l'ensemble des fonctions lipschitziennes de différentielle $L^(2)$.
    On montre que cette forme quadratique est fermable. On obtient ainsi un
    opérateur auto-adjoint $Δ$ associé. //TODO: Def de fermable ?
]

#theorem(title: [@cheegerStructureSpacesRicci2000])[
  On suppose que les variétés $(X_n)$ sont compactes pour $n in NN ∪ {∞}$.
  Alors le spectre des laplaciens est discret, et s'il
  $ (X_n, x_n, d_n, m_n) -->^("GH") (X_(∞), x_(∞), d_(∞), m_(∞)), $
  alors
  $
    λ_(k)^(n) stretch(arrow)_(n -> ∞) λ_(k)^(∞)
  $
]<thmCheegerColding>

#theorem(title: [@gigliGiorgiGromovWorking2023])[
  La convergence de Gromov-Hausdorff implique la convergence des énergies de Dirichlet
  $E_n --> E_(∞)$ "au sens de Mosco" ($Γ$-convergence faible et forte).
  Si on a une convergence faible
  $ f_n in L^(2)(m_n) stretch(harpoon)^(thick L^(2) thick) f in L^(2)(m_(∞)), $
  alors
  $
    E_(∞)(f, f) ⩽ liminf_(n -> ∞) E_n (f_n, f_n),
  $
  et pour toute fonction $g in L^(2)(m_(∞))$, il existe une suite $(g_n)$ de fonctions
  $L^(2)$ qui converge fortement vers $g$, telle que
  $
    E_(∞)(g, g) = lim_(n -> ∞) E_n (g_n, g_n).
  $
]<thmGigliMondinoSavare>

#remark[
  Les convergences forte et faible dans le
  @thmGigliMondinoSavare sont définies via les plongements
  isométriques donnés par la convergence de Gromov-Hausdorff. 
  Plus précisément, on utilise les définitions
  $
    f_n in L^(2)(m_n) stretch(harpoon)^(thick L^(2) thick) f in L^(2)(m_(∞))\
    <==>\ ∀ φ : Z --> RR "continue bornée", quad integral_(Z) φ f compose ι_(n)^(-1) dif (ι_n)_(sharp) m_n
    stretch(arrow)_(n -> ∞) integral_(Z) φ f compose ι_(∞)^(-1) dif (ι_(∞))_(sharp) m_(∞)
  $
  et $f_n -->^(L^(2)) f_(∞)$ signifie que $f_n stretch(harpoon)^(L^(2)) f_(∞)$ et
  $norm(f_n)_(L^(2)(m_n)) stretch(arrow)_(n -> ∞) norm(f_(∞))_(L^(2)(m_(∞))).$
  Le résultat implique la convergence des valeurs propres dans le cas
  compact (@thmCheegerColding), et la convergence des fonctions
  propres et projecteurs spectraux. L'exemple des graphes métriques
  ne rentre pas dans ce cadre car ils ne vérifient pas de condition
  de borne inférieure sur la courbure de Ricci. La courbure tend
  vers $-∞$ lorsque l'épaisseur $ε$ tend vers $0$, proche des
  sommets du graphe.
]

*Explication du vocabulaire :*
Retour sur les conditions $CD(K, N)$ et $RCD$. La première signifie
"Courbure $⩾ K$, Dimension $⩽ N$" et a été introduite par Sturm et Lott-Villani.
Gigli-Mondino-Savaré ont introduit la condition $RCD(K, N)$ qui ajoute une condition
permettant l'existence d'un laplacien. Cette condition est stable par passage
aux limites de Gromov-Hausdorff mesurées.
