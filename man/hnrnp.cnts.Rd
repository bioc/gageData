\name{hnrnp.cnts}
\Rdversion{1.1}
\alias{hnrnp.cnts}
\docType{data}
\title{
RNA-seq dataset on HNRNPC knockdown and control HeLa cells
}
\description{
  This dataset describes HeLa cell response to RNA-binding protein hnRNP
  C (HNRNPC) knock down. There are two replicate samples from each
  HNRNPC knockdown condition/siRNA (KD1 and KD2). In addition, there are
  four control HeLa cell samples. This is a typical RNA-seq dataset with
  two experimental groups. Experiment and control samples in this study
  should be treated as unpaired. This data is used as the primary
  demo data in the RNA-seq pathway analysis workflow  of \code{gage} package.
}
\usage{data(hnrnp.cnts)}
\details{
  This dataset is also available through EBI ArrayExpress with accession
  number E-MTAB-1147.
  The raw reads data in zipped FASTQ format (fastq.gz) were downloaded
  and mapped to human reference genome (hg19)using tophat2. Then reads
  mapped to annotated gene regions were counted using
  \code{summarizeOverlaps} function from \code{GenomicRanges} package.
}
\source{
  EBI ArrayExpress Experiment E-MTAB-1147:
  <URL: http://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-1147/>
}
\references{
  Luo, W., Friedman, M., Shedden K., Hankenson, K. and Woolf, P GAGE:
  Generally Applicable Gene Set Enrichment for Pathways Analysis. BMC
  Bioinformatics 2009, 10:161
}
\examples{
#data preparation
data(hnrnp.cnts)
cnts=hnrnp.cnts
libsizes=colSums(cnts)
size.factor=libsizes/exp(mean(log(libsizes)))
cnts.norm=t(t(cnts)/size.factor)
sel.rn=rowSums(cnts.norm) != 0
cnts.norm=cnts.norm[sel.rn,]
cnts.norm=log2(cnts.norm+8)

#kegg analysis
if(require(gage)){
data(kegg.gs)
lapply(kegg.gs[1:3],head)
head(rownames(cnts))
ref.idx=5:8
samp.idx=1:4
cnts.kegg.p <- gage(cnts.norm, gsets = kegg.gs,
    ref = ref.idx, samp = samp.idx, compare ="unpaired")
}

#GO analysis
if(require(gage)){
data(go.sets.hs)
data(go.subs.hs)
#molecular function (MF) terms only here as a quick example,
#biological process (BP) and cellular component (CC) term analysis
#could be even more informative.
cnts.mf.p <- gage(cnts.norm, gsets = go.sets.hs[go.subs.hs$MF],
    ref = ref.idx, samp = samp.idx, compare ="unpaired")
}
}
\keyword{datasets}
