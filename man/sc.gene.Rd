\name{sc.gene}
\Rdversion{1.1}
\alias{sc.gene}
\alias{orf2eg}
\docType{data}
\title{
Common IDs used for budding yeast (Saccharomyces cerevisa) genes
}
\description{
These two data provide mapping between Entrez IDs, official symbols and ORF (open reading
frame) IDs for budding yeast genes. These data
are  useful for yeast microarray data analysis. sc.gene is a 3-column
matrix listing the Entrez IDs, official symbols and ORF (open reading
frame) IDs for all known genes. orf2eg is a named vector mapping ORF IDs
to Entrez IDs.
}
\usage{
data(sc.gene)
data(orf2eg)
}
\details{
These mapping data is may be used together with functions
\code{eg2sym} and \code{sym2eg} in the gage package or similar functions. Check the examples
for these functions in gage package.
}
\source{
These mapping data were compiled using the gene data from NCBI
Entrez Gene database.

Similar information can also be derived from Bioconductor package
org.Sc.sgd.db. Please check the package for more information.
}
\references{
  Entrez Gene <URL: http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene>
  }
\examples{
data(sc.gene)
head(sc.gene)
data(orf2eg)
head(orf2eg)

## for more example, check \code{eg2sym} and \code{sym2eg} funtions in
## the gage package. 
}
\keyword{datasets}
