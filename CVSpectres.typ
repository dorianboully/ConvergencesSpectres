#import "lib/lib.typ": *

#show: mathdoc.with(
  thstyle: "article",
)

#include "src/title.typ"

#include "src/presentation.typ"
#v(2cm)

#outline(depth: 2)

#pagebreak()

#include "src/seance1.typ"

#include "src/seance2.typ"

#include "src/seance3.typ"

#include "src/seance4.typ"

#include "src/seance5.typ"

#include "src/seance6.typ"

#include "src/seance7.typ"

#include "src/seance8-9.typ"

#pagebreak()

#bibliography(
  "bib/biblio.bib",
  style: "bib/din-1505-2-alphanumeric.csl",
  full: true,
)
