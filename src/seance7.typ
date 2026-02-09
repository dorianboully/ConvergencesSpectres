#import "../lib/lib.typ": *

== Méthode polynomiale
Dans l'article, détails faits pour le modèle de permutation.
Ici, on continue avec le modèle de configurations.
=== Notations et Rappels
$G_N = (V_N, E_N)$ désigne un graphe aléatoire avec $N = abs(V_N)$ sommets.
On considère une fonction test $phi : ZZ --> CC$ paire à support dans $[-L, L]$.
On note
$
  hat(phi)(s) = sum_(ell in ZZ) phi(ell) q^(i ell s)
  = phi(0) + sum_(ell = 1)^L phi(ell) (q^(i ell s) + q^(-i ell s))
  = phi(0) + sum_(ell = 1)^L phi(ell) T_(ell)(lambda(s)/sqrt(q))
$
sa transformée de Fourier, où $T_(ell)$ est le polynôme de Tchebychev de degré $ell$ défini
par la relation
#equation(id: "eqDefBaseTchebychev")[
  $
    T_(ell)(2 cos theta) = 2 cos(ell theta) arrow.l.r.double.long T_ell (t + t^(-1)) = t^(ell) + t^(-ell).
  $
]

et $lambda(s) = q^(i s) + q^(-i s)$. On notera également $X = lambda(s) / sqrt(q)$. Ainis,
$hat(phi)(s)$ est un polynôme $P$ en $X$ de degré $L$, et les $phi(ell)$ sont les coefficients de
$hat(phi)(s)$ dans la base des polynômes de Tchebychev $(T_(ell))$.
On a vu l'existence des développements asymptotiques suivants.
#theorem[
  Notons $A_N$ la matrice d'adjacence du graphe $G_N$. Alors, pour tout entier $R gt.eq.slant 0$,
  il existe des formes linéaires $mu_0, ..., mu_n "et" tilde(R)_(R + 1, N) in CC[X]^(*)$
  telles que
  #equation(id: "eqDevAsymptotiqueTracePolyFormLin")[
    $
      EE_N [ tr P(A_N / sqrt(q)) ]
      = N integral_(−2)^(2) P(x) dif m (x) + sum_(r = 0)^(R) 1/N^r mu_r (P)
      + 1/N^(R+1) tilde(R)_(R + 1, N)(P)
    $
  ]
  où $m$ désigne la mesure de Kesten-McKay.
]<thTracePolyFormLin>

#remark[
  Dans l'article @chenNewApproachStrong2025, ils utilisent la trace normalisée $tr_N = 1/N tr$.
  Dans ce cas, le développement asymptotique @eqDevAsymptotiqueTracePolyFormLin s'écrit
  $
    EE_N [ tr_N P(A_N / sqrt(q)) ]
    = integral_(−2)^(2) P(x) dif m (x) + sum_(r = 0)^(R) 1/N^(r + 1) mu_r (P)
    + 1/N^(R + 2) tilde(R)_(R + 1, N)(P).
  $
  Il y a donc un décalage d'une puissance de $N$ entre les deux formulations.
]

On a également vu (@prpDistributionDeltaR et @prpDistributionNuR) que l'on peut écrire
$mu_r = delta_r + nu_r$, avec
$
  delta_r (P) = sum_(ell in ZZ) phi(ell) (q^(ell / 2) + q^(-ell / 2)) P_r (ell) quad "et" quad
  nu_r (P) = sum_(ell in ZZ) phi(ell) c_r (ell).
$
Dans cette expression, $P_r$ est un polynôme  de degré au plus $4r$.
Ainsi, $delta_r$ est une combinaison linéaire de la masse de Dirac en
$x_* = lambda_0 / q = sqrt(q) + 1/sqrt(q)$ et de ses dérivées jusqu'à
l'ordre $4r$. En particulier, on a $supp delta_r = { x_* }$.
De plus, pour $0 lt.eq.slant r lt.eq.slant R_c = (sqrt(q) - 1)/2$, on a
$abs(c_r (ell)) = O(ell^(4r)),$ donc $nu_r$ est une distribution d'ordre au plus $4r +1$.
Pour $R_c < r < q/2 - 1$, on a seulement la majoration
$abs(c_r (ell)) lt.eq.slant ell^(4r) (2r + 1)^(ell) q^(-ell slash 2).$
Enfin, pour $r > q/2 - 1$, on a $abs(c_r) lt.eq.slant ell^(4r)q^(ell slash 2)$.

Pour ce qui concerne le reste $tilde(R)_(R + 1, N)$, on ne peut pour l'instant
pas dire mieux que
#equation(id: "eqMajoRestePoly")[
  $
    tilde(R)_(R + 1, N)(P) = sum_(ell in ZZ) phi(ell) d_(R + 1, N)(ell), quad "avec"
    abs(d_(R + 1, N)(ell)) lt.eq.slant ell^(4(R + 1)) q^(ell slash 2).
  $
]

=== Le reste est une distribution

Pour l'instant, la borne @eqMajoRestePoly ne permet pas d'affirmer que
$tilde(R)_(1, N)$ est une distribution. Dans le cours précédent, on a
admis le @thMajorRestePolynomiale, qui garantit que
c'est le cas, et nous avons vu que, combiné avec la @prpDistributionNuR,
on pouvait en déduire la convergence forte. On se propose donc ici
de démontrer le résultat suivant.

#theorem[
  Pour tout $R gt.eq.slant 0$,
  #ilist[
    + $tilde(R)_(R + 1, N)(P)$ est une distribution d'ordre au plus $4(R + 2) +1 = 4R + 9$
      de support inclus dans $[-x_*, x_*]$.
    + $mu_r$ est une distribution d'ordre au plus $4(r+1) + 1 = 4r + 5$
      de support inclus dans $[-x_*, x_*]$, pour tout $0 lt.eq.slant r lt.eq.slant R$.
    + Pour $r lt.eq.slant R_c$, le support de $nu_r$ est inclus dans $[-2, 2]$.
    + Pour $R_c lt r lt.eq.slant q/2 - 1$, le support de $nu_r$ est inclus dans
      $[-x_r, x_r]$, où $x_r = (2r+1)/sqrt(q) + sqrt(q)/(2r+1)$
  ]
]<thDistribResteEtMuR>

==== Démonstration de _(i)_ et _(ii)_ $==>$ _(iii)_ et _(iv)_.
On admet le résultat général suivant sur les distributions.
#proposition[
  Soit $nu in cal(E)^(prime)(RR)$ une distribution à support compact.
  Alors,
  $
    supp nu subset [-rho, rho], quad "où" quad
    rho := limsup_(L -> +infinity) abs(nu(x^(L)))^(1 slash L).
  $
]<prpSupportDistribCompact>

Exprimons le monôme $X^(L)$ dans la base des polynômes de Tchebychev.
$
  X^(L) = sum_(ell = 0)^(L) phi_L (ell) T_(ell)(X), quad "avec" phi_L (ell) gt.eq.slant 0 quad forall 0 lt.eq.slant ell lt.eq.slant L.
$
Si $R_c < r lt.eq.slant q/2 - 1$, on a donc la majoration
$
  abs(nu_r (X^(L))) & lt.eq.slant sum_(ell = 0)^(L) phi_L (ell) abs(nu_r (T_(ell)))
  lt.eq.slant sum_(ell = 0)^(L) phi_L (ell) (2r+1)^(ell) q^(-ell slash 2) ell^(4r + 1)\
  & lt.eq.slant L^(4r + 1) sum_(ell = 0)^(L) phi_L (ell) (((2r+1)/sqrt(q))^(ell) + (sqrt(q)/(2r+1))^(ell))\
  & lt.eq.slant L^(4r + 1) sum_(ell = 0)^(L) phi_L (ell) T_ell (x_r) = L^(4r + 1) x_r^(L).
$
En appliquant la @prpSupportDistribCompact, on en _(iv)_. La même preuve montre
_(iii)_ dans le cas $r lt.eq.slant R_c$.

==== Démonstration de _(i)_ et _(ii)_.
=====
L'expression $EE_N [tr P(A_N)]$ est une fraction rationnelle en $1/N$. En effet,
si $B$ désigne la matrice de Hashimoto de $G_N$, on a vu que
$
  EE_N [ tr P(B^(L))] = (P_L (1/N)) / (Q_L (1/(d N))),
$
avec $deg P_L lt.eq.slant L "et" Q_L (X) = (1-X) (1 - 3X) dots.c (1 - (2L - 1)X).$
D'après la relation
$
  tr((A_N/sqrt(q))^(L)) = sum_(j = 1)^(N) (q^(i s_j) + q^(-i s_j))^(L)
  = sum_(0 lt.eq.slant ell lt.eq.slant L\ ell equiv L mod 2)
  binom(L, (L + ell) /2) (tr B^(L) -(N(d-2))/2),
$
on en déduit que
$
  EE_N [ tr_(N) A_N^(L)] = (tilde(P)_L (1/N)) / (Q_L (1/(d N))), quad
  "avec " deg tilde(P)_L lt.eq.slant L+1.
$
On rappelle que dans cette dernière expression, $tr_N = 1/N tr$ désigne la trace normalisée.
Il suit que si $h in CC_L [X]$ est un polynôme de degré au plus $L$,
il existe un polynôme $Phi_h$ de degré au plus $L + 1$ tel que
$
  EE_N [ tr_N h(A_N / sqrt(q)) ] = (Phi_h (1/N)) / (Q_L (1/(d N))) =: psi_h (1/N).
$
On remarque que le dénominateur $Q_L$ est indépendant de $h$, et que
$psi_h$ dépend linéairement de $h$.
Comme $Psi_h$ est une fraction rationnelle, le développement asymptotique
en puissances de $1/N$ de $psi_h (1/N)$ lorsque $N -> +infinity$ n'est autre
que le développement en série de Taylor de $psi_h$ en $0$.
$
  psi_h (1/N) = sum_(r = 0)^(R+1) (psi_h^((r))(0)) / (N^(r)r!)
  + 1/N^(R + 2) integral_0^(1) (1 - t)^(R+1) /(R+1)! psi_h^((R + 2))(t/N) dif t.
$

===== <secBorneAutoAdj>
Comme la matrice d'adjacence $A_N$ est auto-adjointe et que son spectre est inclus
dans $[- sqrt(q) x_*, sqrt(q) x_*]$, on a la borne suivante
$
  abs(Psi_h (1/N)) = abs(EE_N [ tr_N h(A_N / sqrt(q)) ]) lt.eq.slant norm(h(A/sqrt(q)))
  lt.eq.slant norm(h)_(C^(0)([-x_*, x_*])),
$
où $norm(dot)$ désigne la norme d'opérateur.

===== Inégalité des frères Markov
#theorem[
  Soient $h in CC_L [X]$, et $a > 0$. Alors, pour tout $x in [0, a]$ et tout $m in NN$, on a
  $
    abs(h^((m))(x)) lt.eq.slant 1/(2m - 1)!!(L^(2)/a)^(m) norm(h)_(C^(0)([0, a])).
  $
]

#corollary[
  Si $f, g in CC_L [X]$ et $a > 0$ tel que $g$ ne s'annule pas sur $[0, a]$, alors
  pour tout $x in [0, a]$ et $m in NN$, la fraction rationnelle $Psi := f / g$ vérifie
  $
    abs(Psi^((m))(x)) lt.eq.slant m! ((5 c L^(2))/a)^(m) norm(Psi)_(C^(0)([0, a])), quad "où" quad
    c = sup_(x, y in [0, a]) abs(g(x) / g(y)).
  $
]

#definition[
  Soient $J$ un intervalle de $RR$, $I subset J$ et $epsilon > 0$.
  On dit que $I$ est $epsilon$-dense dans $J$ si $ J subset I + [-epsilon, epsilon]. $
]
#theorem[
  Soient $a > 0$, $h in CC_L [X]$, et $I subset [0, a]$ un sous-ensemble $a / (4L^(2))$-dense
  dans $[0, a]$. Alors,
  $
    norm(h)_(C^(0)([0, a])) lt.eq.slant 2 sup_(x in I) abs(h(x)).
  $

]

#proposition[
  Soit $L in NN$. Soit $a lt.eq.slant 1/(2(L+1)^(2))$ un réel. Alors, l'ensemble $I := { x in [0, a] mid(|) 1/x in NN }$
  est $a / (4(L+1)^(2))$-dense dans $[0, a]$.
]

#proof[
  En effet, la plus grande distance entre deux éléments consécutifs de $I$ est majorée
  par $1/((1/a)(1/a + 1)) = a^(2)/(a+1) lt.eq.slant a/(2(L+1)^(2)).$
]

===== Conclusion
En appliquant ces résultats à la fraction rationnelle $Psi_h$, dont le numérateur
et le dénominateur sont de degré au plus $L + 1$, on obtient, en prenant $a = 1/(2(L+1)^(2))$
$
  norm(Psi_h^((m)))_(C^(0)([0, a])) lt.eq.slant m! (10 c (L + 1)^(4))^(m) sup_(N gt.eq.slant 2(L+1)^(2)) abs(Psi_h (1/N)),
$
où $ c = sup_(x, y in [0, a]) abs((Q_L (x)) / (Q_L (y))) lt.eq.slant sqrt(2)e^(-1/2). $
En utilisant la borne de la @secBorneAutoAdj, il vient
$
  norm(Psi_h^((m)))_(C^(0)([0, 1/(2(L+1)^(2))])) lt.eq.slant C_(m) (L + 1)^(4m) norm(h)_(C^(0)([-x_*, x_*])),
$
où $C_(m)$ est une constante qui ne dépend que de $m$.
De là, la définition de $mu_r$ donne
$
  abs(mu_r (h)) lt.eq.slant C^(prime)_(r) (L+1)^(4(r + 1)) norm(h)_(C^(0)([-x_*, x_*])).
$
Cela implique (exercice, développer $h$ dans la base $T_(ell)(X/x_*)$ + analyse de Fourier) que
$
  abs(mu_r (h)) lt.eq.slant C^(prime.double)_(r) L^(4(r + 1) + 1)
  norm(h)_(C^(4(r + 1) + 1)([-x_*, x_*])),
$
ce qui prouve _(ii)_. Le même raisonnement appliqué à $tilde(R)_(R + 1, N)$
permet de montrer _(i)_.

#remark[
  Si l'on analyse la preuve précédente, on remarque que l'on a utilisé
  le fait que
  $
    norm(h)_(C^(0)[-x_*, x_*]) gt.eq.slant EE_N [ tr_N h(A_N / sqrt(q)) ] = Psi_h (1/N) =
    sum_(r = 0)^(R) 1/N^(r+1) mu_r (h) + 1/N^(R + 2) tilde(R)_(R + 1, N)(h),
  $
  où le membre de droite est le développement de Taylor de $Psi_h$ en $0$. Dès que
  les $mu_r$ sont des distributions de support compact strictement inclus dans $[-x_*, x_*]$,
  et que $tilde(R)_(R + 1, N) = O(norm(h)_(C^(alpha)))$, on peut appliquer la méthode polynomiale.
  On n'a donc pas vraiment besoin que $Psi_h$ soit une fraction rationnelle.
  Voir @mageeStrongConvergenceUniformly2025 pour des revêtements aléatoires de surfaces hyperboliques. //TODO: cite
  Par exemple, une condition suffisante pour appliquer la méthode polynomiale
  à $R = 0$ (a posteriori) est de savoir que pour
  tous $h in CC_(L)[X]$ et $R$ entier, on a
  #equation(id: "eqCSMethodePolyOrdre0")[
    $
      abs(EE_N [ tr_N h(A_N / sqrt(q)) ] - mu_(-1)(h) - F_(R, h) (1/N))
      lt.eq.slant ((c R)^(c R) (c L)^(c(L + R))) / N^(R + 2) norm(h)_(C^(0)),
    $
  ]
  où 
  $ mu_(-1)(h) = integral_(-2)^(2) h dif m $
  est la mesure spectrale limite avec $m$ la mesure de Kesten-McKay, et
  $ F_(R, h) = sum_(r = 0)^(R) mu_r (h)X^(r+1) in CC_(R+1)[X]. $
  On a donc besoint d'un développement limité à l'ordre $R$ quelconque pour ensuite appliquer la
  méthode polynomiale à $R = 0$. Montrons que @eqCSMethodePolyOrdre0 est suffisante.
  En prenant $R = L$ et $N gt.eq.slant (c^(prime)L)^(c^(prime)) =: M$, on trouve
  $
    abs(EE_N [ tr_N h(A_N / sqrt(q)) ] - F_(L, h) (1/N))
    lt.eq.slant ((c^(prime) L)^(c^(prime)L) / N^(L + 2)) norm(h)_(C^(0)) lt.eq.slant norm(h)_(C^(0)) / N^(2).
  $
  De là, on obtient $abs(F_(L, h)(1/N)) lt.eq.slant 2 norm(h)_(C^(0))$. Grâce à l'inéglité des frères Markov,
  on parvient à majorer $F^(prime)$ et $F^(prime.double)$ sur $[0, 1/M]$ par $norm(h)_(C^(alpha))$.
  Il suit
  $
    abs(EE_N [ tr_N h(A_N / sqrt(q)) ] - mu_(-1)(h) - (mu_0 (h))/N) lt.eq.slant norm(h)_(C^(alpha)) / N^(2).
  $
  dès que $N gt.eq.slant M$. Si $N < M$, on utilise le fait que $mu_0$ est une distribution
  de support connu pour obtenir
  $
    abs(EE_N [ tr_N h(A_N / sqrt(q)) ] - mu_(-1)(h) - (mu_0 (h))/N) lt.eq.slant 
    2 norm(h)_(C^(0)) + L^(beta)/N norm(h)_(C^(alpha)) lt.eq.slant
    L^(beta^(prime))norm(h)_(C^(alpha)) / N^(2) lt.eq.slant norm(h)_(C^(beta^(prime)+1)) / N^(2).
  $
  pour un choix de $beta^(prime)$ convenable. On a obtenu une majoration de la forme
  du _(i)_ du @thDistribResteEtMuR, pour $R = 0$ comme attendu.
]
