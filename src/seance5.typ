#import "../lib/lib.typ": *

Notons $γ_(k)(G)$ le nombre de géodésiques périodiques primitives de longueur $k$
dans un graphe $G$. Étant donné un graphe $Γ$, on note $X_N (Γ)$ le nombre
de réalisations étiquetées de $Γ$ dans $G_N$. On cherche à étudier le
comportement asymptotique de $EE_(N)(γ_(k)(G_N))$ lorsque $N$ tend vers l'infini et
$k$ est fixé. En partitionnant l'ensemble des géodésiques périodiques primtives
selon leur graphe rempli puis la forme de celui-ci, on obtient les égalités suivantes
$
  EE_(N)(γ_(k)(G_N)) & = sum_(Γ) "Comb"(Γ) EE_(N)(X_N (Γ))γ_(k)(Γ) \
                     & = sum_(F) "Comb"(F) sum_(arrow(ell) dot arrow(m) = k) EE_(N)(X_N (F(arrow(ell))))g(arrow(m)), \
$
où, dans la première ligne, $Γ$ parcourt l'ensemble des graphes de valence au
plus $d$ et avec au plus $k$ arêtes et $"Comb"(Γ)$ est un facteur combinatoire
lié au fait que l'on compte plusieurs fois chaque géodésique à cause
des symétries du graphe $Γ$. Dans la deuxième ligne, $F$ parcourt l'ensemble des
formes de graphes, c'est à dire les graphes sans arêtes de valence $⩽ 2$, $arrow(ell)$ et
$arrow(m)$ sont des vecteurs d'entiers positifs indexés par les arêtes de $F$ contenant
respectivement les longueurs et les multiplicités des arêtes de $F$ dans la géodésique
considérée, $F(arrow(ell))$ est le graphe obtenu en remplaçant chaque arête $e$ de $F$ par une
chaîne d'arêtes de longueur $arrow(ell)(e)$ (autrement dit le graphe rempli par la géodésique),
$g(arrow(m))$ est le nombre de géodésiques primitives de $F$ de vecteur de multiplicité
$arrow(m)$ (les différents cycles peuvent être parcourus dans des ordres différents) et
$"Comb"(F)$ est un facteur combinatoire lié aux symétries de la forme $F$. On observe
que la longueur d'une géodésique primitive sur $F$ est $arrow(ell) dot arrow(m)$, d'où le domaine
de sommation dans la deuxième ligne.
//TODO: dessins
En utilisant la @propDevTaylorFG, on obtient
$
  EE_(N)(γ_(k)(G_N)) & = sum_(F) "Comb"(F)/N^(b(F) - 1) sum_(arrow(ell) dot arrow(m) = k)
                       g(arrow(m))sum_(r = 1)^(R) [(P_(r)(ell)) / N^r (d-1)^(ell) + O(ell^(2(R+1)) / N^(R+1)(d-1)^(ell))]
$
avec $P_(r)$ un polynôme de degré $2r$ et $ell = abs(arrow(ell))$. On a une borne grossière obtenue en remarquant
que $g(arrow(m))$ est au plus le nombre de géodésiques de longueur $m := abs(arrow(m))$ sur $F$,
donc $g(arrow(m)) ⩽ λ_(F)^(m)$, où $λ_(F)$ est la valeur propre de Perron-Frobenius de la matrice
de Hashimoto de $F$. En utilisant le fait que $λ_F ⩽ q = d-1$, et que $ell, m ⩽ k$, on obtient
$
  g(arrow(m)) ⩽ (d-1)^(m) ⩽ (d-1)^(k) quad "et" quad (d-1)^(ell) ⩽ (d-1)^(k).
$
On peut faire beaucoup mieux en utilisant la relation $arrow(ell) dot arrow(m) = k$.

#definition(title: "Dot Convolution")[
  Soient $n in ℕ$ un entier et $arrow(ξ) in NN^(n)$ fixés. Étant données deux fonctions $f, g : NN^(n) --> CC$, on
  définit leur dot convolution par
  $
    f *_(arrow(ξ)) g (k) := sum_(arrow(ell) dot arrow(m) = k\ arrow(ell) ⩾ arrow(ξ))
    f(arrow(ell)) g(arrow(m)),
  $
  Où l'inégalité $arrow(ell) ⩾ arrow(ξ)$ est définie composante par composante.
]<defDotConvolution>

#definition(title: [Fonction polyexponentielle])[
  Soit $Lambda subset CC$ un ensemble fini.
  On dit qu'une fonction $f : NN^(n) --> CC$ est polyexponentielle de base $Lambda$
  s'il existe une famille de polynômes en $n$ indéterminées
  $(p_(beta))_(beta in Lambda^(n))$, telle que
  pour tout $ell = (ell_1, ..., ell_n) in NN^(n)$, on ait
  $
    f(ell) = sum_(beta in Lambda^(n)) p_(beta)(ell) beta_1^(ell_1) dots.h.c beta_n^(ell_n).
  $
]
Dans le cas du modèle de configuration, nos fonctions polyexponentielles
auront pour base le singleton $Lambda = {q}$. Dans le cas du modèle de permutation,
la base convenable est $Lambda = { q, -1, 1 }$.

#theorem[
  Supposons que $f$ est une fonction polyexponentielle et
  qu'il existe $ρ > 0$ tel que $g$ satisfait la borne
  $
    ∀ ε > 0, quad sup_(arrow(m) dot arrow(ξ) = M) abs(g(arrow(m))) = O((ρ + ε)^(M)).
  $
  Alors $f *_(arrow(ξ)) g$ est la somme d'une fonction polyexponentielle //TODO: Vérif, pas sûr mais dans
  //notre cas, tous les beta sont égaux à (d-1)
  et d'un reste dominé par $(ρ prime + ε)^(k)$, avec
  $ ρ prime = max (sqrt(abs(Lambda)) ∪ { ρ }). $
]<thmDotConvolution>

On va appliquer ce théorème avec les constantes $β_(j) = q$ et $ρ = λ_(F)$. Le
reste l'emporte sur le terme polyexponentiel si $λ_(F) > sqrt(d-1)$. Si on veut un développement
de $EE_(N)(γ_(k)(G_N))$ jusqu'à l'ordre $R$, on peut se restreindre aux formes $F$
dont le rang cyclique $b(F)$ est au plus $R + 1$ (à cause du facteur $N^(1 - b(F))$).
Pour forme de rang cyclique, fixé, la plus grande valeur propre de Perron-Frobenius
de la matrice de Hashimoto est obtenue pour le bouquet de $b(F)$ cercles. En effet, la
la valeur propre de Perron-Frobenius croît lorsque l'on contracte des arêtes, opération
qui permet de ramener n'importe quelle forme à un bouquet de cercles. La matrice de
Hashimoto du bouquet de $b$ cercles est de taille $2b times 2b$, et chaque ligne
comporte exactement une entrée nulle et $2b - 1$ entrées égales à $1$. On en la
majoration $λ_(F) ⩽ 2b(F) - 1$. Ainsi, tant que $2b(F) - 1 ⩽ sqrt(d-1)$, il est
intéressant d'appliquer le théorème @thmDotConvolution. Comme $b(F) ⩽ R + 1$, il n'y
a pas de problème tant que l'on prend
$ R ⩽ 1/2(sqrt(q) - 1) =: R_c $

#corollary[
  On a le développement asymptotique suivant à tout ordre $R$
  $
    EE_(N)(γ_(k)(G_N)) = sum_(r = 0)^(R) (F_(r)(k))/N^r + O(k^(2(R+1)) / N^(R+1) (d-1)^(k)).
  $
  De plus, si $R ⩽ R_c$, alors $F_r$ est une "fonction de Ramanujan"
  $
    F_(r)(k) = p_(2r)(k) (d-1)^(k) + O((d - 1 + ε)^(k/2)),
  $
  avec $p_(2r)$ un polynôme.
]

Écrivons la formule des traces pour obtenir un lien avec le trou spectral. Soit $φ ZZ --> ℂ$
un fonction paire à support borné. On pose
$
  hat(φ)(s) = sum_(ell in ZZ) φ(ell) e^(i ell s),
$
On note $d = λ^((N))_(0) ⩾ λ^((N))_(1) ⩾ dots.h.c ⩾ λ^((N))_(N-1)$ les valeurs propres
de la matrice d'adjacence de $G_N$. On effectue le changement de variable
$
  ∀ 0 ⩽ j ⩽ N-1, quad λ_(j) = q^(1/2 + i s_(j)) + q^(1/2 - i s_(j)).
$
On a la formule
#equation(id: "eqFormuleTraces2")[
  $
    sum_(j = 0)^(N-1) hat(φ)(s_(j)) = N integral hat(φ)(s) dif m(s)
    + sum_(γ) sum_(n ⩾ 1) T(γ) φ(n T(γ))/q^(n T(γ)/2),
  $
]
où $γ$ parcourt l'ensemble des géodésiques périodiques primitives de $G_N$,
valable pour tout graphe $d$-régulier. On sait que le nombre de géodésiques
périodiques primitives de longueur au plus $ell$
dans un graphe à $N$ sommets est au plus $N (d-1)^(ell).$ Ainsi,
dans la formule @eqFormuleTraces2, la partie de la somme où $n ⩾
2$ est dominée par $N$, comme le terme integral, qui est
d'ailleurs déterministe. On s'intéresse donc à la partie de la
somme où $n = 1$. On a donc
#equation(id: "eqEsperanceTF")[
  $
    EE_(N)(sum_(j = 0)^(N-1) hat(φ)(s_(j))) & = EE_(N)(sum_(γ) T(γ) φ(T(γ))/q^(T(γ)/2)) + O(N)\
    & = sum_(ell ⩾ 0) (ell φ(ell))/q^(ell/2) (sum_(r = 0)^(R) (F_(r)(ell))/N^r + O((q^(ell) ell^(2(R+1))) / N^(R+1))) + O(N)\
    & = sum_(ell ⩾ 0) ell φ(ell) [sum_(r = 0)^(R) (p_(2r)(ell)q^(ell / 2))/N^r + O(ell^(c))] + O(N),
  $
]
la dernière égalité étant valable si $R ⩽ R_c$. De plus, on a
$
  hat(φ)(s_j) = sum_(ell) φ(ell) q^(i s_j ell) ⩾ φ(L) q^(abs(Im(s_j)) L),
$
où $L$ est tel que le support de $φ$ est inclus dans $[-L, L]$. On en déduit que
$
  EE_(N)(sum_(j = 0)^(N-1) hat(φ)(s_(j))) & ⩾ φ(L) EE_(N)(q^(abs(Im(s_(1))) L)) \
                                          & ⩾ φ(L) q^(L ε_(0)) PP(abs(Im(s_(1))) ⩾ ε_(0)).
$
On cherche à montrer que pour tout $ε_(0)$, on a $PP(abs(Im(s_(1))) ⩾ ε_(0)) --> 0$
lorsque $N$ tend vers l'infini. Pour cela, il suffit de montrer que @eqEsperanceTF
est sous-exponentiel en $L$. Choisissons une fonction test $φ$ judicieuse 
@friedmanProofAlonsSecond2008a[Chapter 11, A Sidestepping Lemma]. 
On considère l'opérateur
#equation(id: "eqOperateurDiff")[
  $
    cal(D) := a + a^(*) - (q^(1/2) + q^(-1/2)) id
  $
]

agissant sur les fonctions test $ZZ --> ℂ$, où $a$ est l'opérateur de translation
$φ arrow.r.bar.long φ(1 + dot)$, et $a^(*)$ son adjoint, qui translate dans l'autre
sens. On applique la formule des traces à $cal(D)^(m) φ$ au lieu de $phi$,
de sorte que
$
  hat(cal(D)^(m)phi)(s) = (q^(i s) + q^(-i s) - (q^(1/2) + q^(-1/2)))^(m)hat(φ)(s).
$
Prenons $m$ pair fixé. En utilisant un procédé de sommation d'Abel, on obtient
$
  sum_(ell ⩾ 0) ell cal(D)^(m)φ(ell) sum_(r = 0)^(R) (p_(2r)(ell)q^(ell / 2))/N^r & = sum_(ell ⩾ 0) φ(ell) sum_(r = 0)^(R) cal(D)^(m)(bb(1)_(ZZ_(+))(ell p_(2r)(ell)q^(ell / 2))/N^r)
                                                                                    + O(N + L) \
$
Finalement, en prenant $m$ assez grand, comme les $p_(2r)$ sont des polynômes,
on obtient le résultat suivant
#equation(id: "eqEstimationEsp")[
  $
    EE_(N)(sum_(j = 0)^(N-1) hat(cal(D)^(m) φ)(s_(j))) & = O(N + L + (L^(c)q^(L/2))/N^(R+1) norm(φ)), quad
  $
  $
    norm(φ) := sum_(ell ⩾ 0) ell abs(φ(ell))q^(ell/2).
  $
]
D'autre part, on a
#equation(id: "eqMajorationProba")[
  $
    EE_(N)(sum_(j = 0)^(N-1) hat(cal(D)^(m) φ)(s_(j)))
    & = EE_(N)(sum_(j = 0)^(N - 1) (q^(i s_(1)) + q^(-i s_(1)) - (q^(1/2) + q^(-1/2)))^(m) hat(φ)(s_j)) \
    & ⩾ q^(ε_(0)L) PP(abs(Im(s_(1))) ⩾ ε_(0)).
  $
]
En combinant @eqEstimationEsp et @eqMajorationProba et en choisissant $L = 2(R+2)log(N)$, de sorte
que $q^(L/2) = N^(R + 2)$, on obtient
$
  PP(abs(Im(s_(1))) ⩾ ε_(0)) = O(L^(c) q^(-2 ε_(0)(R+2) log(N))N) stretch(arrow)_(N --> ∞) 0 quad "si" quad ε_(0) > 1/ (2(R+2)).
$
Si le développement asymptotique de $EE_(N)(γ_(k)(G_N))$ était valable pour tout ordre $R$, on
pourrait prendre $R$ arbitrairement grand et conclure que $PP(abs(Im(s_1)) ⩾ ε_(0))$ tend
vers $0$ plus rapidement que n'importe quelle puissance de $N$, pour tout $ε_(0) > 0$. On se rend compte
que ce n'est pas le cas, par exemple en évaluant la probabilité qu'une configuration apparie
complètement toutes les demi-arêtes de deux sommets donnés. Le graphe obtenu n'est alors pas
connexe, donc il n'y a pas de trou spectral. La probabilité de cette configuration n'est pas dominée
par toutes les puissances de $N$. Friedman a même montré le résultat suivant.

#corollary[
  Il existe un entier $r ⩽ C sqrt(d) log d$ tel que $F_r$ n'est pas une fonction de Ramanujan.
]

On peut néanmoins toujours obtenir une information intéressante pour
$R_c lt.eq.slant r < (q-1) / 2$. En effet, on a le développement asymptotique
$
  F_r (ell) = p_(2r)(ell) q^(ell) + O(ell^(c)(2r + 1)^(ell)),
$
la borne $2r + 1$ étant atteinte pour le bouquet de $r$ cercles.
