conda create -c bioconda -c conda-forge -c agbiome -n spr r-base=4.1.0 samtools=1.14 bwa-mem2 bbtools=37* parallel whatshap

conda activate spr

conda install -c conda-forge r-devtools
conda install -c r r-zoo
conda install -c bioconda bioconductor-genomicranges

conda remove -n spr --all
conda create -c bioconda -c conda-forge -c agbiome -c r -n spr r-base=4.1.0 samtools=1.14 bwa-mem2 bbtools=37* parallel whatshap r-zoo

cutadapt \
        -b AGATCGGAAGAGCACACGTCTGAACTCCAGTCACNNNNNNNNATCTCGTATGCCGTCTTCTGCTTG \
        -B AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTNNNNNNGTGTAGATCTCGGTGGTCGCCGTATCATT \
        -o output_file.trimmed_R1_001.fastq.gz" \
        -p output_file.trimmed_R2_001.fastq.gz" \
        input_file.R1_001.fastq.gz" \
        input_file.R2_001.fastq.gz" \
        -m 30 \
        -q 15
        
        conda install -c bioconda cutadapt
conda install -c bioconda fastqc

grep -v '^#' ./strandseq_phased_SNVs.vcf | cut -f10 | cut -f1 -d: | grep -v '\.' | sort | uniq -c

sed -e  's/\.|0/1|0/;s/1|\./1|0/;s/\.|1/0|1/;s/0|\./0|1/' ./strandseq_phased_SNVs.vcf  > ./strandseq_phased_SNVs.sub.vcf
