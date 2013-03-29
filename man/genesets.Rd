\name{genesets}
\Rdversion{1.1}
\alias{kegg.sets.hs}
\alias{go.sets.hs}
\alias{carta.hs}
\alias{kegg.sets.mm}
\alias{go.sets.mm}
\alias{kegg.sets.rn}
\alias{go.sets.rn}
\alias{kegg.sets.sc}
\alias{go.sets.sc}

\alias{sigmet.idx.hs}
\alias{go.subs.hs}
\alias{sigmet.idx.mm}
\alias{go.subs.mm}
\alias{sigmet.idx.rn}
\alias{go.subs.rn}
\alias{sigmet.idx.sc}
\alias{go.subs.sc}

\docType{data}
\title{
  Common gene set data collections
}
\description{
  The gene set data collections derived from KEGG, GO
  and BioCarta databases.
}
\usage{
data(kegg.sets.hs)
data(go.sets.hs)
data(carta.hs)
data(kegg.sets.mm)
data(go.sets.mm)
data(kegg.sets.rn)
data(go.sets.rn)
data(kegg.sets.sc)
data(go.sets.sc)

data(sigmet.idx.hs)
data(go.subs.hs)
data(sigmet.idx.mm)
data(go.subs.mm)
data(sigmet.idx.rn)
data(go.subs.rn)
data(sigmet.idx.sc)
data(go.subs.sc)
}
\format{
 kegg.sets.hs is a named list of 229 elements. Each element is a character
 vector of member gene Entrez IDs for a single KEGG pathway. Type
 \code{head(kegg.sets.hs, 3)} for the first 3 gene sets or pathways.

 go.sets.hs is a named list of 17202 elements. Each element is a character
 vector of member gene Entrez IDs for a single Gene Ontology term. Type
 \code{head(go.sets.hs, 3)} for the first 3 gene sets or GO terms.

 sigmet.idx.hs is a index numbers of sinaling and metabolic pathways in
 kegg.set.gs. In other words, KEGG pathway include other types of
 pathway definitions, like "Global Map" and "Human Diseases", which are
 frequently undesirable in pathway analysis. Therefore,
 \code{kegg.sets.hs[sigmet.idx.hs]} gives you the "cleaner" gene sets of
 sinaling and metabolic pathways only.

 go.subs.hs is a named list of three elements: "BP", "CC" and "MF",
 corresponding to biological process, cellular component and molecular
 function subtrees. It may be more desirable to conduct separated GO
 enrichment test on each of these 3 subtrees as shown in the example code.

carta.hs is a named list of 259 elements. Each element is a character
 vector of member gene Entrez IDs for a single BioCarta pathway. Type
 \code{head(carta.hs, 3)} for the first 3 gene sets or pathways.

 These are just KEGG, GO and BioCarta gene sets for the default species,
 i.e. human. KEGG or GO geen sets for other species including mouse (.mm), rat (.rn)
 and yeast (.sc) have similar structure as their counterparts for human.
}
\details{
The human gene set data were compiled using Entrez Gene IDs, gene set names
and mapping information from multiple Bioconductor packages, including:
org.Hs.eg.db, KEGG.db, GO.db and cMAP. Please check the corresponding
packages for more information.

Gene set for other 3 species included here, was built similarly. The
users are encourage to build their own gene set collections for
more species in a similar way or to use the Bioconductor package
GSEABase.
}
\source{
  Human data come from multiple Bioconductor packages, including: org.Hs.eg.db,
  KEGG.db, GO.db and cMAP.
}
\references{
  Entrez Gene <URL: http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene>
  KEGG pathways <URL: ftp://ftp.genome.ad.jp/pub/kegg/pathways>
  Gene Ontology <URL: http://www.geneontology.org/>
  cMAP <URL: http://cmap.nci.nih.gov/PW>
  }

\examples{
if(require(gage)){
#load expression and gene set data
data(gse16873)
cn=colnames(gse16873)
hn=grep('HN',cn, ignore.case =TRUE)
dcis=grep('DCIS',cn, ignore.case =TRUE)

data(kegg.sets.hs)
data(sigmet.idx.hs)
kegg.sigmet.hs=kegg.sets.hs[sigmet.idx.hs]

#make sure the gene IDs are the same for expression data and gene set
#data
lapply(kegg.sets.hs[1:3],head)
head(rownames(gse16873))

#GAGE analysis with signaling and metabolic pathways
gse16873.kegg.sets.p <- gage(gse16873, gsets = kegg.sigmet.hs,
    ref = hn[1:3], samp = dcis[1:3])

data(go.sets.hs)
data(go.subs.hs)
names(go.subs.hs)
go.mf.hs=go.sets.hs[go.subs.hs$MF]

#GAGE analysis with GO Molecular Function gene sets
gse16873.kegg.sets.p <- gage(gse16873, gsets = go.mf.hs,
    ref = hn[1:3], samp = dcis[1:3])
}
}

\keyword{datasets}
