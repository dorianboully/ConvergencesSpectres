#import "../lib/lib.typ": *
En écrivant
$
  hat(phi)(s) = phi(0) + sum_(ell = 1)^(L) phi(ell) T_ell (lambda / q^(1 slash 2))
  = P(lambda / q^(1 slash 2)),
$
avec $T_ell$ le polynôme de Tchebychev défini par $T_ell (2 cos x) = 2 cos (ell x)$
et $P$ un polynôme de degré $L$, la formule des traces s'écrit
#equation(id: "eqFormuleTracesReste")[
  $
    EE_(N)(sum_(j) hat(phi)(s_j)) & = EE_(N)(tr P(A_N / sqrt(q))) \
                                  & = N integral hat(phi)(s) dif m (s) + sum_(r = 0)^(R) 1/N^(r)
                                    sum_(ell in ZZ)ell F_r (ell) phi(ell) q^(-ell / 2) + 1/N^(R + 1) tilde(R)_(R + 1)(phi),
  $
]
où la mesure $m$ est la mesure de Kesten-McKay et le reste $tilde(R)_(R + 1)$ est
une forme linéaire en $phi$. On note, pour $0 lt.eq.slant r lt.eq.slant R$,
$
  Phi_r : phi arrow.r.long.bar sum_(ell in ZZ) ell F_r (ell) phi(ell) q^(-ell / 2)
$
la forme linéaire associée au terme d'ordre $1/N^(r)$ de
la formule des traces @eqFormuleTracesReste.
On a alors une décomposition $Phi_r = delta_r + nu_(r)$, avec
$
  delta_r (phi) = sum_(ell) ell p_(2r)(ell) phi(ell) q^(ell / 2) quad "et" quad
  nu_(r)(phi) = cases(
    sum_ell phi(ell) O(ell^(c)) & quad "si" r lt.eq.slant R_c,
    sum_ell phi(ell) O(ell^(c)((2r + 1)/q^(1 slash 2))^(ell)) & quad "si" R_c lt.eq.slant r < (q - 1)/2.
  )
$
Enfin, le reste $tilde(R)_(R + 1)$ est de la forme
#equation(id: "eqMajorationResteFriedman")[
  $
    tilde(R)_(R + 1)(phi) = sum_(ell) ell^(2(R+1)) phi(ell) O(q^(ell slash 2)).
  $
]
On peut aussi voir $delta_r, nu_r$ et $tilde(R)_(R + 1)$ comme des formes
linéaires du polynôme $P$.

#proposition[
  La forme linéaire $delta_r$ est la somme d'une combinaison linéaire des dérivées
  de $P$ en $sqrt(q) + 1 / sqrt(q)$ jusqu'à
  l'ordre $2r$, et d'une distribution $mu_r (P)$ (au sens de Laurent Schwartz) supportée
  dans $[-2, 2]$ et d'ordre au plus $2(r + 1)$.
]<prpDistributionDeltaR>

#exercise[
  Démontrer la @prpDistributionDeltaR (analyse de Fourier).
  Ainsi, $delta_r$ est une distribution qui
  s'écrit comme la somme d'une masse de Dirac en $sqrt(q) + 1 / sqrt(q)$ et de
  ses dérivées jusqu'à l'ordre $2r$, et d'une distribution supportée dans $[-2, 2]$.
]

#proposition[
  Tant que $r < R_c$, $nu_r$ est une distribution supportée dans $[-2, 2]$.
]<prpDistributionNuR>

Encore une fois, on peut démontrer cette proposition par analyse de Fourier.
Ces résultats sont dejà démontrés par Friedman. La différence avec la méthode
polynomiale réside dans la manière de traiter le reste. Dans la méthode de Friedman,
on se contente de la borne à croissance exponentielle @eqMajorationResteFriedman,
alors que dans la méthode polynomiale, on utilise le résultat plus fort suivant.

#theorem(title: [@chenNewApproachStrong2025])[
  On a la majoration suivante pour le reste.
  $
    tilde(R)_(R + 1)(phi) lt.eq.slant norm(P)_(C^(4R + 9)([-(q+1), q + 1])).
  $
  En particulier, $tilde(R)_(R + 1)$ est une distribution d'ordre $4R + 9$.
  De plus, pour $r gt.eq.slant R_c$, $nu_r$ est une distribution d'ordre $4R + 5$
]<thMajorRestePolynomiale>

#remark[
  Dans la méthode polynomiale, $R = 0$ donne déja la convergence forte. Au contraire,
  dans la méthode de Friedman, l'idée est de prendre $R$ le plus grand possible pour
  obtenir la convergence forte. Dans @friedmanSecondEigenvalueRandom1991, la méthode s'arrête à $R = R_c$.
  Dans @friedmanProofAlonsSecond2008a, on se débarasse de mauvais graphes "tangles", ce qui permet de prendre
  $R$ arbitrairement grand.
]

=== Conclusion de Friedman
Considérons l'opérateur
$ cal(D) := sqrt(q) (a + a^(*)) - (q + 1) id, $
égal à $sqrt(q)$ fois celuis défini par @eqOperateurDiff. Notons $psi = cal(D)^(2R+1)phi$.
On a
$
  hat(psi)(s) = (lambda(s) - (q+1))^(2R+1) hat(phi)(s),
$
de sorte que toutes les dérivées de $hat(psi)$ en $q+1$ s'annulent jusqu'à l'ordre $2R + 1$.
On a donc $delta_r (psi) = 0$. La formule des traces appliquée à $psi$ donne donc
$
  EE_N (sum_j hat(psi)(s_j)) & = N integral hat(psi)(s) dif m (s)
                               + sum_(r = 0)^(R) 1/N^(r) nu_r (psi) + 1/N^(R + 1) tilde(R)_(R + 1)(psi) \
                             & = O(N) + O(1) + O(1/N^(R + 1)(L^(2R+1) norm(phi)_(infinity)q^(L slash 2))),
$
où $L$ désigne toujours une borne du support de $phi$. De plus, par positivité de
$hat(phi)$, tous ses coefficients sont positifs, donc
$
  EE_N (sum_j hat(psi)(s_j)) & = EE_N (sum_j (lambda_j - (q+1))^(2R+1) hat(phi)(s_j)) \
                             & gt.eq.slant EE_N ((lambda_1 - (q+1))^(2R+1) hat(phi)(s_1)) \
                             & gt.eq.slant eta^(2R+1) q^(L slash 2) PP(alpha lt.eq.slant Im s_1 lt.eq.slant 1/2 - eta),
$
avec $eta > 0$ fixé. En imposant $abs(phi) lt.eq.slant 1$, on obtient donc la majoration
$
  PP(alpha lt.eq.slant Im s_1 lt.eq.slant 1/2 - eta)
  lt.tilde (N + L^(2R+1) / (N^(R + 1) q^(L slash 2)))q^(-alpha L)/ eta^(2R+1).
$
En choisissant $L = 2(R+2) log_q (N)$, et $alpha > 1/(2(R+2))$, il vient
$
  PP(alpha lt.eq.slant Im s_1 lt.eq.slant 1/2 - eta) stretch(arrow)_(N -> infinity) 0.
$
La condition supplémentaire $Im s_1 lt.eq.slant 1/2 -eta$ n'est pas gênante, car il
existe $eta > 0$ tel que
$
  PP(lambda_1 gt.eq.slant (q+1) -eta) = O(1/N^(d slash 2 -1)).
$
Pour $eta = 0$, on peut montrer par une méthode de dénombrement (cf. cours de l'année dernière)
que
$
  PP(lambda_1 = q +1) = PP (G_N "non connexe") = O(1/N^(d slash 2 - 1)).
$

=== Conclusion par la méthode polynomiale
On prend $R = 0$. On exprime tout en fonction du polynôme $P$. On a,
#equation(id: "eqTracesPolOrdre0")[
  $
    EE_N (tr P(A_N / sqrt(q))) = N integral_(-2)^(2) P(x) dif tilde(m)(x)
    + delta_0 (P) + nu_0 (P) + 1/N tilde(R)_1 (P).
  $
]

où $A_N$ désigne toujours la matrice d'adjacence de
$G_N$ et $tilde(m)$ la mesure de Kesten-McKay. Par densité des polynômes
dans l'espace $C_(c)^(r)$, on peut remplacer $P$ dans @eqTracesPolOrdre0
par toute fonction $h in C_(c)^(r)([-(q+1), q+1])$, où $r$ est l'ordre maximal
des distributions aparaissant dans cette équation. On veut montrer que
la probabilité que toutes les valeurs propres de $A_N$
(sauf la valeur propre triviale $lambda_0 = d$) soient dans l'intervalle
$[-2 sqrt(q), 2 sqrt(q)]$ tend vers $1$ lorsque $N$ tend vers l'infini. Le changement
de variable $x = lambda / sqrt(q)$ envoie $[-2 sqrt(q), 2 sqrt(q)]$ sur $[-2, 2]$ et
$d$ sur $b := q^(1 slash 2) + q^( - 1 slash 2)$. On fixe $epsilon, eta > 0$ petits, et
on prend une fonction test $h$ à valeurs dans $[0, 1]$ telle que
$
  h(x) =
  cases(
    0 & quad "si" abs(x) lt.eq.slant 2 + epsilon/2 "ou" x = b,
    1 & quad "si" x in [2 + epsilon, b - eta] union [-b, -2 - epsilon].
  )
$
#figure(
  include "./GrapheFctTest.typ",
  caption: [Graphe de la fonction test $h$],
)<figGrapheFctTest>
Par construction, $nu_0 (h) = 0$ car $h$ est nulle sur $[-2, 2]$ et $nu_0$ est
supportée dans cet intervalle d'après la @prpDistributionNuR. De même, la @prpDistributionDeltaR
montre que $delta_0 (h) = 0$. Enfin, on a
$
  integral_(-2)^(2) h(x) dif tilde(m)(x) = 0.
$
L'équation @eqTracesPolOrdre0 appliquée à $h$ s'écrit donc
$
  EE_N (tr h(A_N / sqrt(q))) = 1/N tilde(R)_1 (h) lt.eq.slant norm(h)_(C^9)/N lt.eq.slant 1/(min(epsilon, eta)^(9)N),
$
puisque $tilde(R)_(1)$ est une distribution d'ordre $9$ d'après le @thMajorRestePolynomiale.
D'autre part, par définition de $h$, on a
$
  EE_N (tr h(A_N / sqrt(q))) gt.eq.slant
  PP(lambda_1 in [-b, -(2+epsilon)] union [2+epsilon, b - eta]).
$
On conclut que
$
  PP(lambda_1 in [-b, -(2+epsilon)] union [2+epsilon, b - eta]) stretch(arrow)_(N -> infinity) 0.
$
Comme précédemment, la contrainte faisant intervenir $eta > 0$ n'est pas gênante, et on obtient
encore une fois la convergence forte souhaitée.

=== Raffinements obtenus par la méthode polynomiale (d'après @chenNewApproachStrong2025)
Pour $r gt.eq.slant R_c$, la distribution $nu_r$ est supportée par
$
  abs(x) lt.eq.slant (2r + 1)/sqrt(q) + sqrt(q)/(2r + 1) =: x_r.
$
En choisissant comme fonction test similaire à celle décrite par la @figGrapheFctTest,
mais en remplaçant $2$ par $x_r$, on obtient le raffinement suvant :
$
  PP(abs(lambda_1)/sqrt(q) in [x_r - epsilon, x_r + epsilon]) lt.eq.slant norm(h)_(C^(4r + 9))/N^(r + 1) lt.tilde 1/(epsilon^(4r + 9) N^(r + 1)).
$
On peut d'ailleurs montrer que cette estimation est optimale.

=== Comment Friedman a réussi à dépasser la valeur $R_c$
L'idée est de modifier légèrement le modèle de graphe aléatoire pour éliminer les "tangles"
et ainsi faire en sorte que les $F_r$ soient des fonctions de Ramanujan même
pour $r gt.eq.slant R_c$. On rappelle que ce n'est pas le cas pour le modèle de
configuration (ni pour le modèle de permutations d'ailleurs). On veut montrer que
les $F_r$ sont des fonctions de Ramanujan en utilisant le @thmDotConvolution. Quand nous
avons applié ce théorème, la borne
$
  ∀ ε > 0, quad sup_(arrow(m) dot arrow(ξ) = M) abs(g(arrow(m))) = O((ρ + ε)^(M))
$
donnait lieu à un reste dominant, empêchant la méthode de fonctionner, dès que
$R > R_c$. Cette condition est équivalente à $rho > sqrt(q)$, où $rho$ 
désigne la valeur propre dominante de la matrice de Hashimoto
du graphe rempli $Gamma$ de $G_N$. Dans la méthode de Friedman, le développement
limité à l'ordre $R$ de la formule des traces ne fait intervenir que des graphes remplis
de rang cyclique au plus $R+1$. On a vu que le fait de subdiviser une arête en deux
ne change pas le rang cyclique, et fait diminuer la valeur propre dominante de la matrice de Hashimoto.
Reprenons les notations de la @defDotConvolution. On peut montrer que pour chaque forme $F$
il existe $arrow(xi)$ tel que pour tout $arrow(ell) gt.eq.slant arrow(xi)$, on ait 
$rho(F(arrow(ell))) lt.eq.slant sqrt(q)$. Comme il n'y a qu'un nombre fini de formes,
on en déduit que l'ensemble des graphes remplis $Gamma$ de rang cyclique au plus $R+1$ et
tels que $rho(Gamma) gt sqrt(q)$ est fini. On appelle "tangles" ces graphes. Friedman
a montré que la probabilité que $G_N$ contienne un tangle tend vers $0$ lorsque
$N$ tend vers l'infini. On peut donc appliquer la méthode de développement de la formule
des traces au modèle de graphe aléatoire de configurations conditionné à ne pas 
contenir de tangle, et en déduire la convergence forte souhaitée.



