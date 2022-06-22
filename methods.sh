#################### Indexing the reference genome and running alignment.sh ####################

bwa index -a bwtsw /path/to/reference/fasta/GRCh38

bash alignment.sh numCPU_threads "/path/to/reference/fasta/GRCh38.fasta"

mkdir intermediate fastq
mv *.fastq.gz fastq
mv *.sam *_???.bam intermediate

#################### Running ASHLEYS QC ####################

conda activate ashleys

ashleys.py -j numCPU_threads features -f ./ -w 5000000 2000000 1000000 800000 600000 400000 200000 -o ./features.tsv

ashleys.py predict -p ./features.tsv -o ./quality.txt -m /path/to/ashleys-qc/models/svc_default.pkl

mkdir bam_poor_quality
for i in $(awk '$3<=0.5 {print $1}' quality.txt)
do
     mv $i $i.bai bam_poor_quality
done

conda deactivate

#################### Running SNV calling ####################

ls ./*.bam bam_poor_quality/*.bam > samples.list

callvariants.sh list=samples.list ref=/path/to/reference/fasta/GRCh38.fasta out=strand_seq_snps.vcf ploidy=2 calldel=f callins=f sample="HG005"

#################### Combining chromosome-specific VCF files after a StrandPhaseR run ####################

bcftools concat --threads 4 SPR_output/VCFfiles/chr*.vcf > ./strandseq_phased_SNVs.vcf

#################### Combining Strand-seq phase information with other data types ####################

whatshap phase -o all_phased.vcf --reference=/path/to/reference.fasta --ignore-read-groups all_unphased_SNVs.vcf additional_WGS.bam strandseq_phased_SNVs.vcf 

#################### Splitting reads by haplotype ####################

bgzip strandseq_phased_SNVs.vcf
tabix -p vcf strandseq_phased_SNVs.vcf.gz
whatshap haplotag -o haplotagged.bam --reference /path/to/reference.fasta strandseq_phased_SNVs.vcf.gz data_to_split.bam --ignore-read-groups
samtools view -bh -d HP:1 haplotagged.bam > haplotagged.hap1_only.bam
