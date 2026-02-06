#import "../lib/lib.typ": *

= Convergence forte des matrices hermitiennes gaussiennes (d'après @haagerupNewApplicationRandom2005a)
== Vocabulaire des probabilités libres
Soit $(cal(A), +, times, I, *)$ une $C^(*)$-algèbre, c'est à dire une $CC$-algèbre
associative unitaire de Banach munie d'une involution $CC$-antilinéaire
$*: cal(A) --> cal(A)$ telle que, pour tous $a, b in cal(A)$, on a
#ilist[
  + $(a b)^(*) = b^(*) a^(*)$ ;
  + $norm(a a^(*)) = norm(a)^2$.
]
En particulier, il résulte du (i) que $I^(*) = I$.

#definition(title: [Espace de probabilité non commutatif])[
  Un _état_ sur $cal(A)$ est une forme linéaire $tau: cal(A) --> CC$ vérifiant
  les conditions suivantes.
  #ilist[
    + $tau(I) = 1$ (normalisation) ;
    + $tau(a^(*)a) gt.eq.slant 0$ pour tout $a in cal(A)$ (positivité).
  ]
  Un _espace de probabilité non commutatif_ est la donnée d'une $C^(*)$-algèbre
  munie d'un état.
  Un état $tau$ est dit _tracial_ si, pour tous $a, b in cal(A)$, on a
  $tau(a b) = tau(b a)$. Il est dit _fidèle_ si, pour tout $a in cal(A)$ non nul,
  $tau(a^(*)a) > 0$.
]

#remark[
  Un état $tau$ est automatiquement continu et de norme $norm(tau) = tau(I) = 1$.
  Si $tau$ est fidèle, alors pour tout $a in cal(A)$ non nul, on a
  $
    lim_(k -> infinity) tau((a^(*)a )^k)^(1/(2k)) = norm(a).
  $
]

#definition[
  Un élément $a in cal(A)$ est appelé _variable aléatoire non commutative_. Sa loi est la
  donnée des moments joints $tau(P(a, a^(*)))$, où $P$ décrit l'ensemble des polynômes
  en deux variables non commutatives. Dans le cas où $a$ est auto-adjoint, sa loi est déterminée
  par la famille des moments $tau(a^k)$, $k gt.eq.slant 1$.
]

#definition(title: [Loi semi-circulaire])[
  On dit que $a in cal(A)$ suit une _loi semi-circulaire_ si
  $a$ est auto-adjoint et si, pour tout $k gt.eq.slant 1$, on a
  $
    tau(a^(k)) = integral_(-2)^(2) t^(k) sqrt(4 - t^2) / (2 pi) dif t.
  $
]

La notion de liberté est une analogie non commutative de l'indépendance en
théorie des probabilités classique.

#definition[
  Une famille finie $(cal(A)_1, ..., cal(A)_r)$ de sous-algèbres de $cal(A)$ est dite
  _libre_ si, pour tout $k gt.eq.slant 1$, pour toute suite d'indices
  $j_1, ..., j_k in { 1, ..., r }$ telle que $j_i eq.not j_(i+1)$ pour
  $1 lt.eq.slant i lt.eq.slant k$ et $j_k eq.not j_1$,
  et pour toute collection $a_i in cal(A)_(j_i), thick (1 lt.eq.slant i lt.eq.slant k)$
  de variables aléatoires centrées (ie. $tau(a_i) = 0$ pour $1 lt.eq.slant i lt.eq.slant k$), on a
  $
    tau(a_1 a_2 dots.c a_k) = 0.
  $
  Une famille d'éléments $x_1, ..., x_r in cal(A)$ est dite _libre_ si les sous-$C^(*)$-algèbres
  engendrées par chacun d'eux forment une famille libre.
]

== Convergence faible et forte en distribution
#definition(title: [Convergence faible et forte en distribution])[
  Soit $r gt.eq.slant 1$ fixé. Soient $(cal(A), tau)$ et $(cal(A)_N, tau_N), thick (N gt.eq.slant 1)$
  des espaces de probabilité non commutatifs. On se donne également $r$ variables aléatoires
  non commutatives $a_1^((N)), ..., a_r^((N)) in cal(A)_(N)$ pour tout $N gt.eq.slant 1$.
  #ilist[
    + On dit que la famille $(a_1^((N)), ..., a_r^((N)))_(N gt.eq.slant 1)$ converge
      faiblement en distribution vers une famille $(a_1, ..., a_r) in (cal(A), tau)$
      si pour tout polynôme $P$ en $2r$ variables non commutatives, on a
      #equation(id: "eqCVFaibleDistribution")[
        $
          tau_N (P(a_1^((N)), ..., a_r^((N)), (a_1^((N)))^(*), ..., (a_r^((N)))^(*))) stretch(arrow)_(N -> infinity)
          tau(P(a_1, ..., a_r, a_1^(*), ..., a_r^(*))).
        $
      ]

    + On dit que la famille $(a_1^((N)), ..., a_r^((N)))_(N gt.eq.slant 1)$ converge
      fortement en distribution vers une famille $(a_1, ..., a_r) in (cal(A), tau)$
      si elle converge faiblement en distribution vers $(a_1, ..., a_r)$ et si, de plus,
      pour tout polynôme $P$ en $2r$ variables non commutatives, on a
      #equation(id: "eqCVForteDistribution")[
        $
          norm(P(a_1^((N)), ..., a_r^((N)), (a_1^((N)))^(*), ..., (a_r^((N)))^(*)))_(cal(A)_N)
          stretch(arrow)_(N -> infinity)
          norm(P(a_1, ..., a_r, a_1^(*), ..., a_r^(*)))_(cal(A)).
        $
      ]
  ]
]<defCVFaibleForteDistribution>

#remark[
  Cette définition généralise la notion de convergence faible et forte des matrices
  aléatoires vue précédemment. En effet, si l'on prend $r = 1$ et que l'on considère
  des variables aléatoires auto-adjointes, alors la condition _(i)_ est équivalente à la
  convergence faible des mesures spectrales, et la condition _(ii)_ est équivalente à la
  convergence du spectre en topologie de Fell.
]

== Théorème de Haagerup -- Thorbjørnsen
Dans la suite, on fixe une famille $(x_1, ..., x_r) in (cal(A), tau)$ de variables aléatoires
non commutatives libres suivant chacune une loi semi-circulaire.

#theorem(title: [@haagerupNewApplicationRandom2005a[Theorem A]])[
  Soit $cal(A)_N$ la $C^(*)$-algèbre des matrices de taille $N times N$ à coefficients complexes,
  munie de l'état tracial $tau_N = 1/N tr$ donné par la trace normalisée. Pour tout $N gt.eq.slant 1$,
  on se donne $A_1^((N)), ..., A_r^((N))$ des matrices hermitiennes
  aléatoires sur un espace probabilisé $(Omega, PP)$, indépendantes, et de même loi gaussienne
  $
    exp(- (N / 2) tr(A^2)) dif A, quad "où" quad
    dif A = product_(i = 1)^(N) dif A_(i i)
    product_(1 lt.eq.slant i < j lt.eq.slant N) dif Re(A_(i j)) dif Im(A_(i j))
  $
  est la mesure de Lebesgue sur l'espace des matrices hermitiennes. Alors, presque sûrement,
  la famille $(A_1^((N)), ..., A_r^((N)))_(N gt.eq.slant 1)$ converge fortement en distribution
  vers la famille semi-circulaire libre $(x_1, ..., x_r)$. Autrement dit, il existe un ensemble
  $B subset Omega$ de mesure pleine (ie. $PP(B) = 1$) tel que, pour tout $omega in B$, et tout
  polynôme $P$ en $2r$ en 2r variables non commutatives, @eqCVFaibleDistribution et @eqCVForteDistribution soient vérifiées.
]

#remark[
  + Il n'est pas nécessaire de supposer que les matrices $A_i^((N))$ et $A_j^((M))$ sont indépendantes
    pour $M eq.not N$.
  + Comme les matrices $A_i^((N))$ sont hermitiennes, on peut se restreindre aux polynômes en
    $r$ variables non commutatives dans @eqCVFaibleDistribution et @eqCVForteDistribution.
    On note d'ailleurs $CC chevron.l X_i chevron.r_(i in I)$ l'algèbre des polynômes non
    commutatifs en les variables $X_i$, $i in I$.
  + Pour $r = 1$ le moment $EE[tau_N ((A^((N)))^(k))]$ se calcule explicitement et converge
    vers le moment $tau(x^(k))$ de la loi semi-circulaire (voir @voiculescuLimitLawsRandom1991). Le
    passage de la convergence de l'espérance à la convergence presque-sûre peut se faire
    par une estimation des moments (voir @hiaiSemicircleLawFree2000). La convergence
    spectrale forte $ norm(A^((N))) stretch(arrow)_(N -> infinity)^(upright(p.s.)) 2 $
    peut se faire par un calcul explicite des moments exponentiels $EE[tau_N (e^(t A^((N))))]$
]

== Quelques étapes de la preuve de la convergence des normes @eqCVForteDistribution
On veut montrer que, pour tout $P in CC chevron.l X_1, ..., X_r chevron.r$,
#equation(id: "eqCVNormePS")[
  $
    norm(P(A_1^((N))(omega), ..., A_r^((N))(omega))) stretch(arrow)_(N -> infinity)^(upright(p.s.))
    norm(P(x_1, ..., x_r)).
  $
]

=== Astuce de linéarisation de Pisier
On admet le résultat suivant (voir @pisierLinearizationTrick2019)
#theorem(title: [Astuce de linéarisation de Pisier])[
  Pour montrer @eqCVNormePS pour tout $P in CC chevron.l X_1, ..., X_r chevron.r$, il suffit
  de montrer que pour tout $m gt.eq.slant 1$ et pour toutes matrices
  symétriques hermitiennes $b_0, ..., b_r in cal(H)_(m)(CC)$, il existe un ensemble
  $B subset Omega$ de mesure pleine tel que pour tout $omega in B$, on ait
  #equation(id: "eqInclusionSpectrePisier")[
    $
      forall epsilon > 0, exists N_0 gt.eq.slant 1, quad
      (N gt.eq.slant N_0 ==> sp(H^((N))(omega)) subset sp(h(w)) + ]-epsilon, epsilon[),
    $
  ]
  où
  $
    H^((N)) = b_0 times.o I_N + sum_(i = 1)^(r) b_i times.o A_i^((N)) in cal(M)_(m)(CC) times.o cal(A)_N
  $
  et
  $
    h = b_0 times.o I_cal(A) + sum_(i = 1)^(r) b_i times.o x_i in cal(M)_(m)(CC) times.o cal(A).
  $
]<thmLinearisationPisier>

#remark[
  Le @thmLinearisationPisier permet de prouver une convergence forte presque-sûre.
  On a un énoncé similaire pour une convergence forte en probabilité 
  @pisierLinearizationTrick2019[Remark 13].
]

On fixe donc $m gt.eq.slant 1$ et des matrices symétriques hermitiennes
$b_0, ..., b_r in cal(H)_(m)(CC)$, et on se propose de montrer @eqInclusionSpectrePisier
a lieu presque sûrement. La démonstration que l'on donne est basée sur une idée de
@froeseTransferMatricesHyperbolic2006.
Sans perte de généralité, on peut supposer les $b_i$ symétriques
réelles. En effet, dans le cas général, on peut trouver des matrices
symétriques réelles $b^(prime)_i in cal(M)_(2m)(RR)$ de même spectre que les $b_i$.
On peut également supposer que les $b_i$ sont inversibles par densité et continuité du spectre.

=== Transformée de Stieltjes matricielle

#definition[
  Soient $(cal(B), tau_(cal(B)))$ un espace de probabilité non commutatif et $m gt.eq.slant 1$
  un entier. Pour une variable aléatoire non commutative
  $X in cal(M)_(m)(CC) times.o cal(B)$, on appelle _transformée de Stieltjes
  matricielle_ (ou _résolvante_) de $X$ l'application
  $
    cal(M)_(m)(CC) --> cal(M)_(m)(CC), quad
    lambda arrow.r.long.bar (I_m times.o tau_cal(B)) ( (lambda times.o I_cal(B) - X)^(-1) ).
  $
]

Dans la suite, on note $G$ et $G_N$ les transformées de Stieltjes
matricielles respectives de $h$ et $H^((N))$. On définit également $overline(G)_N = EE[G_N]$.
Ainsi, d'après la définition précédente, on a, pour tout $lambda in cal(M)_(m)(CC)$,
$
  G(lambda) = (I_m times.o tau)( (lambda times.o I_cal(A) - h)^(-1) ) in cal(M)_(m)(CC)
$
et
$
  G_N (lambda) = (I_m times.o tau_N)( (lambda times.o I_N - H^((N)))^(-1) ) in cal(M)_(m)(CC).
$

=== Demi-espace de Siegel
#definition[
  On appelle _demi-espace de Siegel_, et l'on note $SH_m$ l'ensemble des matrices
  de taille $m times m$ symétriques (pas au sens hermitien) et
  dont la partie imaginaire est définie positive.
  Pour $m = 1$, on retrouve le demi-plan de Poincaré $HH$.
]

#proposition[
  Le demi-espace de Siegel $SH_m$ est stable par les transformations suivantes :
  #ilist[
    + $Z arrow.r.long.bar - Z^(-1)$ ;
    + $Z arrow.r.long.bar B^(top) Z B$ pour toute matrice $B$ inversible réelle ;
    + $Z arrow.r.long.bar (A Z + B)(C Z + D)^(-1)$ pour toutes matrices $A, B, C, D$
      réelles de taille $m times m$ telles que la matrice par bloc
      $
        mat(
          delim: "[",
          A, B;
          C, D
        ) in cal(M)_(2m)(RR)
      $
      soit symplectique, c'est à dire que $C^(top)A$ et $D^(top)B$ sont symétriques
      et $D^(top)A - B^(top)C = I_m$. On appelle homographie ces transformations.
  ]
]<prpopStabiliteSiegel>

#exercise[
  Prouver la @prpopStabiliteSiegel.
]

Le demi-espace de Siegel est muni d'une famille de métriques
finslériennes (analogue d'une métrique riemannienne, sans imposer aux normes
des espaces tangents d'être issues d'un produit scalaire) $d_p$, $1 lt.eq.slant p lt.eq.slant infinity$,
définies par
$
  d_p (Z_1, Z_2) = inf_(gamma)
  integral_0^1 norm(gamma^(prime)(t))_(p, gamma(t)) dif t,
$
où $gamma$ parcourt l'ensemble des chemins de classe $C^1$ joignant $Z_1$ à $Z_2$ et,
pour tout $Z = X + i Y in SH_m$, et toute matrice $W in cal(M)_(m)(CC)$, on a posé
$
  norm(W)_(p, Z) = tr((W_(Y)^(*)W_Y)^(p/2))^(1/p), quad "avec" quad W_Y = Y^(-1/2) W Y^(-1/2).
$

#exercise(title: [Pas facile])[
  Montrer que les métriques $d_p$ sont préservées par les homographies du demi-espace de Siegel
  (_(iii)_ de la @prpopStabiliteSiegel).
]

Comme pour le demi-plan de Poincaré, on a une isométrie
$
  SH_m --> SD_m, quad Z arrow.r.long.bar (Z - i I_m)(Z + i I_m)^(-1),
$
où $SD_m$ est l'ensemble des matrices de taille $m times m$ symétriques de norme strictement
inférieure à $1$.

=== Méthode de point fixe
On va utiliser une idée venant du lemme de Schwarz-Pick pour les fonctions holomorphes du disque.
#lemma(title: [Schwarz-Pick])[
  Soit $f : DD --> DD$ une fonction holomorphe du disque de Poincaré dans lui même.
  Alors $f$ est contractante pour la métrique métrique hyperbolique
  $
    d_H (z_1, z_2) = abs((z_1 - z_2) / (1 - overline(z_1) z_2)).
  $
  De plus, le seul cas où $f$ n'est pas strictement contractante
  est celui où c'est une transformation de Möbius (donc en particulier une isométrie).
]

On admet (voir @mingoFreeProbabilityRandom2017) que $G$ vérifie l'équation
$
  sum_(i = 1)^(r) b_i G(lambda) b_i G(lambda) + (b_0 - lambda) G(lambda) + I_m = 0.
$
On en déduit que
$
  (sum_(i = 1)^(r) b_i G(lambda) b_i + (b_0 - lambda)) G(lambda) = - I_m,
$
puis, en posant $Z(lambda) = -G(lambda)$, il vient
$
  Z(lambda) = Phi_(lambda)(Z(lambda)), quad "où" quad Phi_(lambda)(W) = -(sum_(i = 1)^(r) b_i W b_i + (lambda - b_0))^(-1).
$
D'après la @prpopStabiliteSiegel, $Phi_(lambda)$ est une transformation du
demi-espace de Siegel (car on a supposé les matrices $b_i$ symétriques réelles inversibles).

#proposition(title: [Master equation])[
  On a, pour tout $N$, l'identité suivante
  #equation(id: "eqMasterEquation")[
    $
      EE[sum_(i = 1)^(r) b_i G_N (lambda) b_i G_N (lambda) + (b_0 - lambda) G_N (lambda) + I_m] = 0.
    $
  ]
]

#proof(title: [Idée de la démonstration])[
  C'est une conséquence de l'identité suivante.
  Pour toutes variables aléatoires $X_1, ..., X_M$ indépendantes suivant une loi gaussienne
  $cal(N)(0, sigma^(2))$, on a
  $
    forall j in { 1, ..., M }, quad sigma^(2) EE[partial_(X_j) f(X_1, ..., X_M)] = EE[X_j f(X_1, ..., X_M)],
  $
  ce qui vient de l'intégration par parties
  $
    integral_(RR)f^(prime) (x) e^(-x^(2) / 2) dif x
    = integral_(RR) x f(x) e^(-x^(2) / 2) dif x.
  $
]
==== Inégalité de Poincaré
L'équation @eqMasterEquation n'étant pas linéaire en $G$, on ne peut pas
intervertir l'espérance et la fonction $Phi_(lambda)$. On va donc
utiliser une inégalité de concentration pour montrer que $G_N
(lambda)$ est proche de son espérance $overline(G)_N (lambda)$.
L'inégalité de Poincaré par rapport à la mesure de Lebesgue
dit que si $Omega subset RR^(M)$ est un ouvert
borné connexe à bord régulier, et $u$ est une fonction de classe $C^1$ sur $Omega$
alors
$
  norm(u - overline(u))_(L^2(Omega)) lt.eq.slant C norm(nabla u)_(L^2(Omega)),
$
où $overline(u)$ désigne la moyenne de $u$ sur $Omega$ et $C > 0$ est une constante
ne dépendant que de $Omega$. On a l'inégalité analogue pour la mesure gaussienne
$nu = cal(N)(0, sigma^(2)I_M)$ sur $RR^(M)$, et pour $f : RR^(M) --> RR$ de classe $C^1$.
$
  integral_(RR^(M)) abs(f(x) - overline(f))^2 dif nu(x) lt.eq.slant sigma^(2)
  integral_(RR^(M)) abs(nabla f(x))^2 dif nu(x).
$
Autrement dit, si $X$ est un vecteur gaussien de loi $cal(N)(0, sigma^(2)I_M)$, alors
$
  V(f(X)) lt.eq.slant sigma^(2) EE[abs(nabla f(X))^2].
$

==== Conséquence
Notons $C_0 = norm(lambda)$ et $C_1 = norm((Im lambda))^(-1)$.
L'inégalité de Poincaré permet d'obtenir l'estimée suivante
$
  EE[sum_(i = 1)^(r) b_i G_N (lambda) b_i G_N (lambda)]
  = sum_(i = 1)^(r) b_i overline(G)_N (lambda) b_i overline(G)_N (lambda)
  + O(C_1^(4)/N^2).
$
Il suit
$
  norm(sum_(i = 1)^(r) b_i overline(G)_N (lambda) b_i overline(G)_N (lambda) + (b_0 - lambda) overline(G)_N (lambda) + I_m)
  = O(C_1^(4)/N^2),
$
puis, en posant $Z_N (lambda) = - overline(G)_N (lambda)$ et en factorisant par $Z_N (lambda)$,
#equation(id: "eqQuasiPointFixeZN")[
  $
    norm(Z_N (lambda) - Phi_(lambda)(Z_N (lambda))) = O(C_1^(5)/N^2).
  $
]

=== Quelques bornes a priori
Pour tous $lambda, W in SH_m$, on a // TODO: Justifier
$norm(Phi_(lambda)(W)) lt.eq.slant C_1$, donc $Phi_(lambda)$ envoie
le demi-espace de Siegel dans une boule de rayon $C_1$ pour la norme opérateur. On
a également $norm(Z(lambda)) lt.eq.slant C_1$ et $norm(Z_N (lambda)) lt.eq.slant C_1$
pour tout $N$ et tout $lambda in SH_m$ d'après les définitions des résolvantes.
On montre également que, pour la distance $d_(infinity)$ sur $SH_m$,
$
  W & arrow.r.long.bar sum_(i = 1)^(r) b_i W b_i quad && "est contractante" ; \
  W & arrow.r.long.bar - W^(-1)quad                   && "est une isométrie" ; \
  W & arrow.r.long.bar W + b_0 quad                   && "est une isométrie" (b_0 "réelle").
$

#proposition[
  Soit $Y$ une matrice réelle symétrique définie positive. Si $norm(Y) lt.eq.slant K$, alors
  pour tout $v in RR^(m)$, on a
  $
    chevron.l v, (Y + Im lambda)v chevron.r gt.eq.slant (1 + c) chevron.l v, Y v chevron.r,
  $
  avec $c = 1/(K C_1)$.
]
On en déduit les inégalités suivantes pour $M in SH_m$ et $Y$ symétrique réelle définie positive.
$
  norm((Y + Im lambda)^(-1)) lt.eq.slant norm(Y^(-1)) / (1 + c)
$
puis
#equation(id: "eqMajorationNormeInfiniTangent")[
  $
    norm((Y + Im lambda)^(-1 slash 2) M (Y + Im lambda)^(-1 slash 2))
    lt.eq.slant norm(Y^(-1 slash 2) M Y^(-1 slash 2)) / (1 + c).
  $
]

On rappelle que par définition de la distance $d_(infinity)$, si $gamma$ est une courbe tracée
dans $SH_m$, sa longueur $ell_(infinity)(gamma)$ pour la métrique $d_(infinity)$ vérifie
$
  ell_(infinity)(gamma) = integral_0^1 norm(gamma^(prime)(t))_(infinity, gamma(t)) dif t
  = integral_(0)^(1)
  norm((Im gamma(t))^(-1 slash 2) gamma^(prime)(t) (Im gamma(t))^(-1 slash 2)) dif t.
$
Supposons de plus que pour tout $t in [0, 1]$, $norm(Im gamma(t)) lt.eq.slant K$. Alors,
d'après @eqMajorationNormeInfiniTangent, on a
$
  ell_(infinity)(gamma + Im lambda) lt.eq.slant (ell_(infinity)(gamma)) / (1 + c).
$

=== Passage de la norme d'opérateur $norm(.)$ à la distance $d_(infinity)$
En utilisant l'estimée de "quasi point fixe" @eqQuasiPointFixeZN en norme d'opérateur,
on peut montrer le résultat suivant.
#proposition[
  Lorsque $N^(2) > 2 C_1^(4)(1 + C_0 + C_1)$, on a également l'estimée de "quasi point fixe"
  pour $Z_N (lambda)$ en distance $d_(infinity)$ suivante.
  $
    d_(infinity)(Z_N (lambda), Phi_(lambda)(Z_N (lambda))) = O(C_1^(6)/N^2).
  $
]<prpQuasiPointFixeZNInfini>

#proposition[
  Soit $alpha > 0$ petit.
  Si $Z_1, Z_2 in SH_m$ sont dans la boule de centre $0$ et de rayon $C_1$,
  et si $d_(infinity)(Z_1, Z_2) lt alpha$, alors toute géodésique joignant $Z_1$ à $Z_2$ est
  contenue dans la boule de centre $0$ et de rayon $C_1 / (1-alpha)$, et
  $norm(Z_1 - Z_2) lt.eq.slant (alpha C_1) / (1 - alpha)$
]<prpBorneNormeDistance>

=== Estimée de la distance entre les résolvantes.
En appliquant les #ref(<prpQuasiPointFixeZNInfini>, supplement: "Propositions")
et #ref(<prpBorneNormeDistance>, supplement: none), on obtient,
pour $N$ suffisamment grand et $k$ entier,
#equation(id: "eqContractionPhi")[
  $
    d_(infinity)(Phi_(lambda)^(k)(Z_N (lambda)), Phi_(lambda)^(k+1)(Z_N (lambda))))
    = (1 / (1 + c))^k O(C_1^(6)/N^2).
  $
]
À $N$ fixé, on en déduit que la suite $Phi_(lambda)^(k)(Z_N (lambda))$ est de Cauchy pour
la distance $d_(infinity)$, et converge donc vers l'unique point fixe de $Z(lambda)$
de $Phi_(lambda)$. De plus, en sommant @eqContractionPhi pour $k$ allant de $0$ à $infinity$,
on obtient
$
  d_(infinity)(Z_N (lambda), Z(lambda)) lt.eq.slant (1 + c)/ c thick O(C_1^(6)/N^2).
$

En repassant à la norme d'opérateur et en remplaçant $c$ par son expression en fonction de $C_1$,
on trouve l'estimée
#equation(id: "eqEstimationResolvante")[
  $
    norm(overline(G)_N (lambda) - G(lambda)) lt.tilde 1/N^(2) (1 + C_0) C_1^(alpha), quad "avec" quad
    alpha = 8.
  $
]

=== Conclusion
Concluons la preuve de @eqInclusionSpectrePisier à partir de cette estimée.
On introduit les mesures
$
  mu_N (phi) = EE[(tau_m times.o tau_N) (phi(H^((N))))] quad "et" quad
  mu (phi) = (tau_m times.o tau) (phi(h))
$
définies pour toute fonction test $phi : RR --> CC$ continue sur un voisinage du spectre
de $H^((N))$ (resp. $h$) par calcul fonctionnel.
On considère également les transformées de Stieltjes (usuelles) de ces mesures,
données pour tout $lambda in HH$ par
$
  g_N (lambda) = integral_(RR) (dif mu_N (t)) / (lambda - t) = tau_m (overline(G)_(N)(lambda I_m)) quad "et" quad
  g (lambda) = integral_(RR) (dif mu (t)) / (lambda - t) = tau_m (G(lambda I_m)).
$
D'une part, l'estimée @eqEstimationResolvante donne en prenant la trace
#equation(id: "eqEstimeeResolvanteUsuelle")[
  $
    forall lambda = x + i y in HH, quad abs(g_N (lambda) - g(lambda))
    lt.tilde 1/N^(2) (1 + C_0) C_1^(alpha) = 1/N^(2) (1 + abs(lambda)) abs(y)^(-alpha).
  $
]

D'auter part, on a les identités usuelles
#equation(id: "eqIdentiteStieltjes")[
  $
      mu (phi) & = - 1/pi lim_(y -> 0^+) integral_(RR) phi(x) Im[g (x + i y)] dif x ; \
    mu_N (phi) & = - 1/pi lim_(y -> 0^+) integral_(RR) phi(x) Im [g_N (x + i y)] dif x.
  $
]

En effet, on a
$
  - Im g_N (x + i y) = -Im [integral_(RR) (dif mu_N (t)) / (x + i y - t)] = integral_(RR) y / ((t - x)^2 + y^2) dif mu_N (t).
$
En appliquant le théorème de Fubini, on a
$
  - 1/pi integral_(RR) phi(x) Im[g_N (x + i y)] dif x
  & = 1/pi integral_(RR) phi(x) [integral_(RR) y / ((t - x)^2 + y^2) dif mu_N (t)] dif x\
  & = integral_(RR) [integral_(RR) phi(x) Psi_y (t - x)dif x] dif mu_N (t)\
  & = mu_N (phi * Psi_y),
$
avec
$
  Psi_y (x) = 1/pi y / (x^2 + y^2).
$
On reconnait que $Psi_(y)$ est une approximation de l'identité, ce qui donne @eqIdentiteStieltjes en
faisant tendre $y$ vers $0^+$. La justification pour $mu$ est analogue.
Notons $h_N (lambda) = g_N (lambda) - g(lambda)$. Il suit des définitions que $h_N$
est holomorphe sur $HH$. D'après @eqIdentiteStieltjes, on a pour toute fonction test $phi$
à valeurs réelles
#equation(id: "eqDifferenceMesuresFctStieljes")[
  $
    mu_N (phi) - mu (phi) = - 1/pi Im [lim_(y -> 0^+) integral_(RR) phi(x) h_N (x + i y) dif x].
  $
]

On transforme l'intégrale du membre de droite grâce à des intégrations par parties successives.
On trouve
$
  integral_(RR) phi(x) h_N (x + i y) dif x = integral_(RR) (1 + partial_(x))^(p) phi(x) I_p (x + i y) dif x,
$
où la fonction $I_p$ est définie par
$
  I_p (lambda) = 1/(p-1)! integral_(RR_(+)) h_N (lambda + t) t^(p-1) e^(-t) dif t.
$
La fonction $t arrow.r.long.bar h_N (lambda + t) t^(p-1) e^(-t)$ étant holomorphe
au voisinage de l'adhérence du demi-plan de Poincaré, la formule intégrale de Cauchy
montre la valeur de l'intégrale qui définit $I_p (lambda)$ ne change pas si l'on
remplace le domaine d'intégration $RR_+$ par la demi-droite $(1+i)RR_+$. Ainsi,
$
  I_p (lambda) = (1+i)^(p)/(p-1)! integral_(RR_+) h_N (lambda + (1+i) t) t^(p-1) e^(-(1+i)t) dif t.
$
Cela nous permet d'utiliser l'estimée @eqEstimeeResolvanteUsuelle, pour obtenir,
en écrivant $lambda = x + i y$,
$
  abs(I_p (lambda)) lt.eq.slant 2^(p slash 2)/(p-1)!
  integral_(RR_+) (1 + abs(lambda) + 2t)/ (N^(2)(y + t)^alpha) t^(p-1) e^(-t) dif t.
$
On voit alors qu'en choisissant $p$ suffisamment grand (par exemple $p = alpha + 1$),
on obtient un constante $C > 0$ telle que
$ I_p (lambda) lt.eq.slant C/N^(2)(1 + abs(lambda)). $
En réinjectant cette dernière majoration dans @eqDifferenceMesuresFctStieljes, on trouve
enfin
$
  abs(mu_N (phi) - mu (phi)) = O(norm(phi)_(C^(alpha+1)) / N^(2)).
$
On peut alors conclure en choisissant une fonction test $phi$ qui est
nulle sur un $sp(h) + [-epsilon slash 2, epsilon slash 2]$ et égale à $1$
sur sur le complémentaire de $sp(h) + ]-epsilon , epsilon [$. En effet, on obtient
alors
$
  1/N EE[Lambda_(N, epsilon)] = mu_N (phi) = O(1/N^(2)), 
$
où $Lambda_(N, epsilon)$ désigne le nombre de valeurs propres (comptées avec multiplicité) 
de $H^((N))$ appartenant au complémentaire de $sp(h) + ]-epsilon , epsilon [$.
L'astuce de linéarisation de Pisier permet alors de conclure à la convergence forte
@eqCVNormePS en probabilité. Pour obtenir la convergence forte presque-sûre,
il faut travailler un peu plus pour contrôler la variance de $Lambda_(N, epsilon)$ et
appliquer le lemme de Borel-Cantelli.

#remark(title: [Ouverture])[
  @huangOptimalEigenvalueRigidity2024 traite le cas des graphes réguliers aléatoires par des
  techniques de matrices aléatoires (utilisant notamment l'équation de Point fixe).
  Les auteurs ont montré que, avec les notations de la @secCVSpecForteGraphesReguliers,
  que la suite
  $
    (lambda_1(A_N / sqrt(q)) - 2)N^(2 slash 3) 
  $
  converge en distribution vers la loi de Tracy-Widom.

  On peut également mentionner les travaux 
  @mageeStrongConvergenceUniformly2025@hideSpectralGapPolynomial2025@hideSpectralGapPolynomial2025a,
  dans lesquels la méthode polynomiale est appliquée à des modèles de 
  surfaces hyperboliques aléatoires.
]
