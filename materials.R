###################### Installing R packages ######################

install.packages(c("devtools","BiocManager"))
BiocManager::install(c("GenomicRanges","GenomicAlignments", "BSgenome", "BSgenome.Hsapiens.UCSC.hg38", "zoo", "breakpointR"), force = TRUE)
devtools::install_github("daewoooo/StrandPhaseR")
