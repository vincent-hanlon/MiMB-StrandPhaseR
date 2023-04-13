## MiMB-StrandPhaseR

This repository is provided for the convenience of readers of the book chapter "Chromosome-length Haplotypes with StrandPhaseR and Strand-seq", part of the Haplotyping editions of the Methods in Molecular Biology series. Cloning this repository is likely an easier way to obtain the short sections of code included with the chapter than either copying the code from a PDF or transcribing it from a paper copy. 

With the exception of alignment.sh, you can't just download these files and run them as scripts. For one thing, the conda environments won't behave nicely (you'll need to activate and deactivate them from the command line). Instead, you should chop up the files and comment out sections you don't need, then run individual lines and commands. Hopefully this saves you some typing.

A preprint of the chapter is hosted by the library of the University of British Columbia [here](http://hdl.handle.net/2429/80678). Note that the code in this repository is slightly more up-to-date than the code in the preprint---namely, "--ignore-read-groups" should be used in Methods 7a (beforehand, it might also be worth using Note 9 to fill in missing genotypes) and "sample='HG005'" should be used in Methods 4. Also, the preprint does not mention that the reference genome should have chromosome names like chr1, chr2, etc. (rather than 1, 2, etc. or the funny NCBI chromosome names). Also, the preprint uses the wrong aligner in Methods 1b (i.e., 3.1b): the intention was to use bwa-mem2 rather than bwa-mem (although both should work; or any other standard short read aligner).

If you should run into problems working through the chapter and running the code, feel free to post an issue.

Note: The R/Conda installations can be tricky. If a package or dependency fails to install in R, try installing it with Conda first. For example, in one case the R package "rtracklayer" failed to install. The trick was to install the dependency openssl with conda first, then install rtracklayer, StrandPhaseR, etc. 
