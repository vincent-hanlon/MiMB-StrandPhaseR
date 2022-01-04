################# Downloading example data ##################

mkdir SPR
cd SPR
wget  ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/ChineseTrio/HG005_NA24631_son/Strand-Seq_BCCRC/*
wget ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/ChineseTrio/HG005_NA24631_son/NISTv4.2.1/GRCh38/HG005_GRCh38_1_22_v4.2.1_benchmark.vcf.gz

################# Verifying that it downloaded correctly ##################

for i in *.fastq.gz; do md5sum $i; done > new.md5sum.txt
diff new.md5sum.txt gm24631.md5sum.txt

################# Installing ASHLEYS QC ##################

git clone https://github.com/friendsofstrandseq/ashleys-qc.git ashleys-qc
cd ashleys-qc
conda env create -f environment/ashleys_env.yml
conda activate ashleys
python setup.py install
conda deactivate
cd ..
