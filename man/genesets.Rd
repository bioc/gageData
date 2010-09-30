\name{genesets}
\Rdversion{1.1}
\alias{kegg.gs}
\alias{go.gs}
\alias{carta.gs}
\alias{kegg.mm}
\alias{go.mm}
\alias{kegg.rn}
\alias{go.rn}
\alias{kegg.sc}
\alias{go.sc}

\docType{data}
\title{
  Common gene set data collections
}
\description{
  The gene set data collections derived from KEGG, GO
  and BioCarta databases.
}
\usage{
data(kegg.gs)
data(go.gs)
data(carta.gs)
data(kegg.mm)
data(go.mm)
data(kegg.rn)
data(go.rn)
data(kegg.sc)
data(go.sc)
}
\format{
 kegg.gs is a named list of 205 elements. Each element is a character
 vector of member gene Entrez IDs for a single KEGG pathway. Type
 \code{head(kegg.gs, 3)} for the first 3 gene sets or pathways.

 go.gs is a named list of ~10000 elements. Each element is a character
 vector of member gene Entrez IDs for a single Gene Ontology term. Type
 \code{head(go.gs, 3)} for the first 3 gene sets or GO terms.

 carta.gs is a named list of 259 elements. Each element is a character
 vector of member gene Entrez IDs for a single BioCarta pathway. Type
 \code{head(carta.gs, 3)} for the first 3 gene sets or pathways.

 These are just KEGG, GO and BioCarta gene sets for the default species,
 i.e. human. KEGG or GO geen sets for other species including mouse (.mm), rat (.rn)
 and yeast (.sc) have similar structure as their counterparts for human.
}
\details{
The human gene set data were compiled using Entrez Gene IDs, gene set names
and mapping information from multiple Bioconductor packages, including:
org.Hs.eg.db, kegg.db, go.db and cMAP. Please check the corresponding
packages for more information.

Gene set for other 3 species included here, was built similarly. The
users are encourage to build their own gene set collections for
more species in a similar way or to use the Bioconductor package
GSEABase.
}
\source{
  Human data come from multiple Bioconductor packages, including: org.Hs.eg.db,
  kegg.db, go.db and cMAP.
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

data(kegg.gs)

#make sure the gene IDs are the same for expression data and gene set
#data
lapply(kegg.gs[1:3],head)
head(rownames(gse16873))

#GAGE analysis
gse16873.kegg.p <- gage(gse16873, gsets = kegg.gs,
    ref = hn[1:3], samp = dcis[1:3])
}
}

\keyword{datasets}
