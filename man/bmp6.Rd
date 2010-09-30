\name{bmp6}
\Rdversion{1.1}
\alias{bmp6}
\docType{data}
\title{
A microarray dataset on BMP6 treated mesenchymal stem cells
}
\description{
  This dataset describes mesenchymal stem cell response to BMP6
  treatment. This is a typical small dataset with as few as two samples
  per condition like in most experimental studies. BMP6 treated samples
  and controls are one-on-one matched. This data has been extensively
  analyzed in GAGE paper, and was used as the primary demo data in
  earlier versions of \code{gage} package.
}
\usage{data(bmp6)}
\details{
  This dataset is also available through Gene Expression Omnibus (GEO)
  with accession number GSE13604.
Notice that \code{bmp6} dataset is processed differently than
GSE13604. \code{bmp6} dataset used a updated probe set definition (CDF)
file based on Entrez Gene mapping, while GSE13604 used the original CDF
based on UniGene mapping.
}
\source{
  GEO Dataset GSE13604:
  <URL: http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE13604>
}
\references{
  Luo, W., Friedman, M., Shedden K., Hankenson, K. and Woolf, P GAGE:
  Generally Applicable Gene Set Enrichment for Pathways Analysis. BMC
  Bioinformatics 2009, 10:161
}
\examples{
data(bmp6)
colnames(bmp6)

#kegg analysis
if(require(gage)){
data(kegg.gs)
lapply(kegg.gs[1:3],head)
head(rownames(bmp6))
bmp6.kegg.p <- gage(bmp6, gsets = kegg.gs,
    ref =c(1,3), samp = c(2,4))
}
}
\keyword{datasets}
