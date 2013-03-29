\name{gse16873.full}
\Rdversion{1.1}
\alias{gse16873.full}
\alias{gse16873.2}
\alias{gse16873.affyid}
\docType{data}
\title{
GSE16873: a breast cancer microarray dataset
}
\description{
GSE16873 is a breast cancer study (Emery et al, 2009) downloaded
from Gene Expression Omnibus (GEO). GSE16873 covers
twelve patient cases, each with HN (histologically
 normal), ADH (ductal hyperplasia), and DCIS (ductal carcinoma in situ)
 RMA samples. Hence, there are 12*3=36 microarray hybridizations or
 samples interesting to us plus 4 others less interesting in the full
 dataset, gse16873.full. Dataset gse16873 in gage and gse16873.2 in this
 package are half datasets each with only HN and DCIS samples of 6
 patients. Dataset gse16873.affyid is similar to gse16873 in gage
 package, except that row IDs are Affymetrix probe set IDs instead of
 Entrez Gene IDs. This is becuase Affymetrix original CDF (hgu133a)
 instead of Entrez Gene based on CDF was used when
 processing the raw data.

 Details section below gives more information on the datasets.
}

\usage{
data(gse16873.full)
data(gse16873.2)
data(gse16873.affyid)
}
\details{
 Due to the size limit of the software package gage, we split
 GSE16873 into two halves, each including 6 patients with their HN and
 DCIS but not ADH tissue types. The gage package only
includes the first half dataset for 6 patients as the example dataset
gse16873. Most of our demo analyses are done on the first half dataset,
except for the advanced analysis where we use both halves datasets with
all 12 patients. 

Raw data for these two half datasets were
 processed separately using two different methods, FARMS
and RMA, respectively to generate the non-biological data
heterogeneity. The first half dataset is named as gse16873, the second
half dataset named gse16873.2. We also have this full dataset,
gse16873.full, which includes all HN, ADH and DCIS samples of all 12
patients, processed together using FARMS.
}
\source{
  GEO Dataset GSE16873:
  <URL: http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE16873>
}
\references{
Emery LA, Tripathi A, King C, Kavanah M, Mendez J, Stone MD, de las
Morenas A, Sebastiani P, Rosenberg CL: Early dysregulation of cell
adhesion and extracellular matrix pathways in breast cancer
progression. Am J Pathol 2009, 175:1292-302.
}
\examples{
##usage of the full dataset
data(gse16873.full)
#column/smaple names
cn=colnames(gse16873.full)
hn=grep('HN',cn, ignore.case =TRUE)
sh=grep('SH',cn, ignore.case =TRUE)
adh=grep('ADH',cn, ignore.case =TRUE)
dcis=grep('DCIS',cn, ignore.case =TRUE)

#multi-state comparison based on f-test
fac=rep(NA, 40)
fac[hn]='hn'
fac[sh]='sh'
fac[adh]='adh'
fac[dcis]='dcis'
if (require(genefilter)){
    fstats=rowFtests(gse16873.full[, -sh],
    as.factor(fac[-sh]))[,1,drop=FALSE]
    fstats=cbind(fstat=fstats)

    \dontrun{
    if(require(gage)){
        data(kegg.gs)
        lapply(kegg.gs[1:6],head)
        head(rownames(fstats))
        #feed fstats as single-column matrix into gage
        gse16873.fstats.kegg.p <- gage(fstats, gsets = kegg.gs,
                  ref = NULL, samp = NULL)
        head(gse16873.fstats.kegg.p$greater)
    }
    }
}

##for usage of the half datasets, check the help information for
##heter.gage function in the gage package.

#use of gse16873.affyid
\dontrun{
if(require(hgu133a.db) & require(gage)){
egids2 <- hgu133aENTREZID[affyid]
annots=toTable(egids2)
str(annots)

gse16873.affyid=gse16873.affyid[annots$probe_id,]
#if multiple probe sets map to a gene, select the one with maximal IQR
iqrs=apply(gse16873.affyid, 1, IQR)
sel.rn=tapply(1:nrow(annots), annots$gene_id, function(x){
x[which.max(iqrs[x])]
})
gse16873.egid=gse16873.affyid[sel.rn,]
rownames(gse16873.egid)=names(sel.rn)

library(gage)
data(gse16873)
cn=colnames(gse16873.egid)
hn=grep('HN',cn, ignore.case =T)
dcis=grep('DCIS',cn, ignore.case =T)
data(kegg.gs)
gse16873.kegg.p.affy <- gage(gse16873.egid, gsets = kegg.gs,
    ref = hn, samp = dcis)
#result should be similar to that of using gse16873
}
}
}
\keyword{datasets}
