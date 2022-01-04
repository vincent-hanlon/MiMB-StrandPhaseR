################## For running BreakPointR and choosing WC regions ###################

library(breakpointR)
breakpointr(inputfolder = "./", outputfolder = "./BPR_output/",
windowsize = 2000000, binMethod = 'size', pairedEndReads = TRUE, pair2frgm = FALSE, min.mapq = 10, filtAlt = TRUE, background = 0.1, minReads = 50, numCPU=4)

exportRegions(datapath = "./BPR_output/data", file = "wc_regions.txt", collapseInversions = FALSE, minRegionSize = 5000000, state = 'wc')

################## For running StrandPhaseR ###################

library(StrandPhaseR)
library(BSgenome.Hsapiens.UCSC.hg38)
library(parallel)

chromosomes <- c('chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8','chr9','chr10','chr11','chr12','chr13','chr14','chr15','chr16','chr17','chr18','chr19','chr20','chr21','chr22')

strandPhaseR(inputfolder = "./", outputfolder="./SPR_output", positions = "strand_seq_snps.vcf",
WCregions = "wc_regions.txt", pairedEndReads = TRUE, num.iterations = 3, numCPU=4, exportVCF="HG005", bsGenome='BSgenome.Hsapiens.UCSC.hg38',
chromosomes=chromosomes)

################## For replicating a StrandPhaseR run ###################

strandPhaseR(inputfolder = "./", outputfolder="./SPR_output", positions = "strand_seq_snps.vcf",
WCregions = "wc_regions.txt", configfile = "StrandPhaseR.config")
