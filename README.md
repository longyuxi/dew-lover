# Dew Lover
A repository keeping the code for part of the work of Kiehart lab.

## Goal of this repo:
To keep a documentation of how everything is done, so that we can reproduce everything, may it be good or bad, and future student researchers can have a place to resume the research from.

This repository will be kept public so that anyone who needs it can find it. 

## How to use this repo
- This repo is public, so do not put sensitive information in this repo. Use `.gitignore` to hide it if necessary.
- Update the last section of this README whenever something is changed on the RAPID VM.
- Toss in potentially useful information related to this project or bioinformatics overall. 
- There's a `data` folder that is set to be ignored by Git. Use `bash generate_file_tree.sh` to generate a tree of it every time something new is uploaded.

## Things to go over with Hector eventually
1. Key-based SSH login (done)
2. Setting up VS Code for working with a remote machine (done)
3. Basic Git usage (and see how `git push` works with someone else's computer)
4. Basic Linux navigation
5. Basic Markdown syntax

## Detailed instructions for getting started with using the Duke RAPID VM with key-based login and Visual Studio Code

1. Make sure the machine is powered on by going to the [research toolkit's website](https://rtoolkits.web.duke.edu/home/login), navigate to our project, click the button next to our machine and click the "power on" button on the top if necessary.

2. SSH should be installed by default if you are using Windows 10, Mac OS or most Linux distributions. make sure that you have `ssh` installed on your computer by typing `ssh` inside Powershell (Windows) or Terminal (MacOS and Linux). If the output starts with "usage:...", you are good to go!

3. Connect to Duke VPN.

4. Download the SSH key files (`id_ed25519` and `id_ed25519.pub`) somewhere safe on your computer (probably not Desktop).

5. In your terminal (Powershell or Terminal), type the following command: `ssh -i path/to/ssh/private/key rapiduser@rapid.machine.address`, substituting `path/to/ssh/key` and `rapid.machine.address` accordingly. For example, on my computer at the time of writing, it would be `ssh -i "C:\Users\Yuxi Long\.ssh\id_ed25519" rapiduser@rapid-1372.vm.duke.edu`. For Windows, you can do the following steps to input the path to the private key.
    1. Type `ssh -i`
    2. Drag and drop the file `id_ed25519` you just saved onto Powershell.
    3. Finish the rest of the command.

6. If everything goes correctly, your terminal should tell you something related to the hosts fingerprint, and asks if you should keep connecting. Type `yes` and enter. The prompt (the stuff to the left of your cursor in the terminal) should have changed into something like `rapiduser@rapid-1372`. Congrats! You just connect to the remote machine. Press 'CTRL + D' to log out, but don't close the terminal yet.

7. Now go to Visual Studio Code (install it if you haven't), click on the extensions button, and look up "SSH" in the extensions marketplace. Install the one called `Remote - SSH` (should be the top one).

8. After the plugin is installed, there should be a button on the left menu that says "Remote Explorer". Click on that. Make sure you see "SSH Targets". If that is not visible, click on the drop-down menu next to "Remote Explorer" and choose "SSH Targets."

9. Put your cursor on top of the bold "SSH targets", there should be a plus sign. Click it. Copy and paste the command you just used to log in to the remote machine with your terminal into where it asks you to "Enter SSH Connection Command." Hit Enter.

10. Now under "SSH Targets", you should see the VM you just added. Hover your mouse over the address, and there should be a "Connect to host in new window" button showing. Click it.

11. First time connecting, VS Code is going to ask what operating system the remote hsot is. Choose Linux. Then VS Code will install a plugin on the remote machine if it isn't there, and you should be connected to the machine. Look at the bottom left of your VS Code window. It should say something like `SSH:rapid-1372.vm.duke.edu`.

12. Now open a folder by going to 'File - Open Folder'. Click 'OK' as it opens your home folder by default. You should be able to see all your files from there.

### What to check if you suddenly can't connect to it one day
- That you are either under the DukeBlue or you are connect to the VPN

- That the virtual machine is turned on

- That you didn't accidentally move the folder that contains the SSH key.

- That the `ssh -i ... ...@...` command still works in your terminal.

## VNC server
- Enabling (if it is not on already): `vncserver -localhost no -geometry 1280x960 -depth 24`

- List sessions: `vncserver -list`

- Kill all instances: `vncserver -kill :*` or just kill a specific instance: `vncserver -kill :1`

## Softwares used (from Hector's paper):

- [GATK](https://www.broadinstitute.org/partnerships/education/broade/best-practices-variant-calling-gatk-1) and [their instructions for the Docker route](https://gatk.broadinstitute.org/hc/en-us/articles/360035889991): (from website) Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.

- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/): (from README) FastQC is an application which takes a FastQ file and runs a series of tests on it to generate a comprehensive QC report.  This will tell you if there is anything unusual about your sequence. 

- [BBMap and BDuk](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/) 

- [BWA](http://bio-bwa.sourceforge.net/) 

- [Picard Tools](http://broadinstitute.github.io/picard)

- [SAMTools](http://www.htslib.org/)

- [SOAPdenovo2](https://github.com/aquaskyline/SOAPdenovo2)

- [MEGAHIT](https://academic.oup.com/bioinformatics/article/31/10/1674/177884)


## Important commands:
- Run GATK Docker image: `docker run -it broadinstitute/gatk`

- Run GATK with the `dew-lover` folder mounted in its root directory: `docker run -v /home/rapiduser/dew-lover:/dew-lover -it broadinstitute/gatk`

- Use `screen` before doing anything so that you can keep it running in the background independently. 

    - `screen` or `screen -S session_name` to create a new screen, 

    - `CTRL + A, D` to detach from screen,

    - `screen -ls` to list all screens, 

    - `screen -r session_name` or just `screen -r` to attach to a screen.  

## Interesting commands and webpages
- [Common Linux commands](https://help.ubuntu.com/community/UsingTheTerminal) and [all-in-one collection of shortcuts](https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index)
- [Using bash history](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)
- `less`: perhaps one of the most important commands ([intro](https://linuxize.com/post/less-command-in-linux/))
- `command > /dev/null 2>&1 &`: redirect stdout to `/dev/null` and `stderr` to stdout, and runs `command` in the background
- `vim`: best text editor (use `vimtutor` to learn)
- `screen`: opens an alternate terminal "screen" that functions exactly like what you would expect for a screen ([intro](https://linuxize.com/post/how-to-use-linux-screen/)) ([how to kill a screen session](https://stackoverflow.com/questions/1509677/kill-detached-screen-session)).

- `${progSamtools} view -b -f 4 ${mappedAll[i]} > ${unmapped[i]}` # output all those "read unmapped" to unmapped[]

- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- `[Ctrl + K] + V` in VS Code to show Markdown preview after installing the extensions Markdown All in One and Markdown Preview enhanced
- Using the remote host feature on VS code
- [Mega collection of bioinformatics resources](https://github.com/jdidion/biotools)
- [PacBio Bioinformatics Training Wiki](https://github.com/PacificBiosciences/Bioinformatics-Training/wiki)
- [Other ways to run a process in the background](https://linuxize.com/post/how-to-run-linux-commands-in-background/)
- [Using && and || operators to tell if process finished successfully](https://unix.stackexchange.com/questions/24684/confusing-use-of-and-operators)
- [More on Linux error codes](https://shapeshed.com/unix-exit-codes/)
- [Using GATK with Docker](https://gatk.broadinstitute.org/hc/en-us/articles/360035889991)
- [Key-based SSH login](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server) and [using remote servers with VS Code](https://code.visualstudio.com/docs/remote/ssh#_getting-started)

- [Docker Tutorial](https://docker-curriculum.com/)

- [Terra](https://app.terra.bio/#library/showcase), a site to see the showcases of GATK

- [Tutorial for mounting a Duke Data Commons Storage](https://oit.duke.edu/help/articles/kb0026376)

- [More Tutorial on mounting a CIFS Share on Linux](https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/)

- [Documentation for the VCF format](http://samtools.github.io/hts-specs/VCFv4.3.pdf)

- [GATK test data](https://s3.amazonaws.com/gatk-test-data/gatk-test-data-readme.html)

- [Parameter expansion in BASH](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

- [Reading parameters passed to a script](https://linuxcommand.org/lc3_wss0120.php)

- [Changing the defaul installation library in R](https://www.accelebrate.com/library/how-to-articles/r-rstudio-library)

- [The FLAG field in SAM files explained](https://broadinstitute.github.io/picard/explain-flags.html)

- [Read Groups](https://gatk.broadinstitute.org/hc/en-us/articles/360035890671?id=6472)

- [GNU Parallel](https://www.gnu.org/software/parallel/parallel_tutorial.html). Using parallel: 
```sh
if [[ -f command_file.tmp ]] ; then rm command_file.tmp ; fi

for ... in ... ; do ; echo ... >> command_file ; done

time parallel --eta < command_file.tmp
```

- [FASTG file format specification](http://fastg.sourceforge.net/FASTG_Spec_v1.00.pdf)

- [A collection of sites for handling GenBank formats](https://molbiol-tools.ca/Convert.htm)

- [Converting GenBank to FASTA](https://www.bioinformatics.org/sms2/genbank_fasta.html)

## For the zasp alignment

- [The unicycler pipeline](https://github.com/rrwick/Unicycler)

- [Comparison between different long reads de novo assemblers](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6966772/)

- Wengan:
```sh
export WG=/dew-lover/tools/wengan-v0.2-bin-Linux/wengan.pl
```
```sh
${WG} -x pacraw \
    -a M \
    -s /dew-lover/mount/3/Raw_Data/zaspFS__sgmca_S19_L004_R1_001.fastq.gz,/dew-lover/mount/3/Raw_Data/zaspFS__sgmca_S19_L004_R2_001.fastq.gz \
    -l /dew-lover/mount/3/Raw_Data/fastq_runid_13041b4c83974516dbb592fc8bd06a38dfd46570.fastq.gz \
    -p wengan_zasp \
    -t 4 \
    -g 180
```

- Converting final contigs to gfa: `python tools/convertToGFA.py mount/3/wengan_zasp.minia.121.contigs.fa mount/3/wengan_zasp.minia.121.contigs.gfa 121`

# Reference guided de novo

- [Paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1911-6)

- To generate insertion statistics of LE-Gal4: `java -jar tools/picard.jar CollectInsertSizeMetrics I=mount/1/data/Alignments/LE-Gal4_sorted.bam O=LE-Gal4_insert_size_metrics.txt H=LE-Gal4_insert_size_histogram.pdf`

- Exporting unmapped reads from all sorted reads: `tools/samtools-1.11/samtools view -b -f 4 mount/1/data/Alignments/LE-Gal4_sorted.bam > mount/1/data/Alignments/LE-Gal4_sorted_unmapped.bam`

- Exporting all those "read paired" and "mate unmapped" from the previous reads: `tools/samtools-1.11/samtools view -b -f 9 mount/1/data/Alignments/LE-Gal4_sorted_unmapped.bam > mount/1/data/Alignments/LE-Gal4_sorted_unmapped_pair.bam`

- Converting the unmappeed reads to fastq: `java -jar tools/picard.jar SamToFastq INPUT=mount/1/data/Alignments/LE-Gal4_sorted_unmapped_pair.bam FASTQ=mount/1/data/Alignments/LE-Gal4_sorted_unmapped.1.fastq SECOND_END_FASTQ=mount/1/data/Alignments/LE-Gal4_sorted_unmapped.2.fastq`

- De Novo assembly of the unmapped reads `SOAPdenovo-63mer all -s mount/1/data/Alignments/*.config -o mount/1/data/Alignments/LE-Gal4_denovo -K 63` where config is

```
#maximal read length
max_rd_len=150
[LIB]
#average insert size of the library
avg_ins=343
#if sequences are forward-reverse of reverse-forward
reverse_seq=0
#in which part(s) the reads are used (only contigs, only scaffolds, both contigs and scaffolds, only gap closure)
asm_flags=3
#in which order the reads are used while scaffolding
rank=1
#minimum aligned length to contigs for a reliable read location (at least 32 for short insert size)
map_len=32
#paired-end fastq files, read 1 file should always be followed by read 2 file
q1=/dew-lover/mount/1/data/Alignments/LE-Gal4_sorted_unmapped.1.fastq
q2=/dew-lover/mount/1/data/Alignments/LE-Gal4_sorted_unmapped.2.fastq
```

- Aligning with Megahit: `megahit -1 mount/1/data/Alignments/LE-Gal4_sorted_unmapped.1.fastq -2 mount/1/data/Alignments/LE-Gal4_sorted_unmapped.2.fastq -o mount/1/data/Alignments/LE-Gal4_megahit_denovo`

- Exporting fastg graph with megahit-toolkit: `megahit_toolkit contig2fastg 141 mount/1/data/Alignments/LE-Gal4_megahit_denovo/intermediate_contigs/k141.contigs.fa > mount/1/data/Alignments/LE-Gal4_megahit_denovo/k141.fastg`

- Trimming down the exported sequences: `java -jar ref-guided-de-novo/RemoveShortSeq.jar -i mount/1/data/Alignments/LE-Gal4_megahit_denovo/final.contigs.fa -length 500 -o mount/1/data/Alignments/LE-Gal4_megahit_denovo/final_500.contigs.fa`

- Trimming down the scaffolds: `java -jar ref-guided-de-novo/RemoveShortSeq.jar -i mount/1/data/Alignments/LE-Gal4_soap_denovo/LE-Gal4_denovo.scafSeq -o mount/1/data/Alignments/LE-Gal4_soap_denovo/LE-Gal4_scafSeq.fa -length 200`

## Using the megahit de novo data:
1. Start the VNC server using the instructions in the VNC section.

2. Open up Bandage by double clicking on the executable from folder `~/bandage`

3. Load the .fastg file from `/dew-lover/mount/1/data/Alignments/PAS-Gal4_complete_megahit_denovo/k141.fastg`.

4. Using the BLAST panel, open up the reference file in `/dew-lover/data/ref/Gal4-ref.fasta`. In the main panel, change the display options to display around the BLAST hits. Setting the distance from BLAST hits to be 10 while using the assembly made by Megahit or 15 while using the assembly made by SPADES seems to be enough.   

## Benchmarking computers with megahit:
Using the paired reads from [Complete Genome Sequence of a 2019 Novel Coronavirus (SARS-CoV-2) Strain Isolated in Nepal](https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR11177792) (3Gb of data in each fastq file), and then running `time megahit -1 WHV-Nepal-61-TW_1.fastq -2 WHV-Nepal-61-TW_2.fastq -o out`.

Time on my desktop with i7-8700K using WSL:
```
real    14m6.986s
user    140m29.106s
sys     0m24.675s
```

on my desktop with i7-8700K using Ubuntu:
```
real	11m23.844s
user	122m39.515s
sys     0m15.793s
```

on the Research Toolkits VM:
```
real    32m1.523s
user    117m0.367s
sys     0m22.450s
```

on my laptop with i7-4700HQ:
```
real    23m5.296s
user    163m34.328s
sys     1m29.531s
```

on my table with i5-6300U:
```
real    45m52.942s
user    167m17.734s
sys     0m57.469s
```

On dcc-rescomp-26 with 78-core Xeon Gold 6252:
```
real    5m16.167s
user    214m44.254s
sys     0m59.015s
```

On 2019 16-inch macbook pro with i9:
```
megahit -1 WHV-Nepal-61-TW_1.fastq -2 WHV-Nepal-61-TW_2.fastq -o out  11359.30s user 43.83s system 1486% cpu 12:47.04 total
```

Also, benchmarking assembling the fly genome with Megahit: `time megahit -1 1/data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq  -2 1/data/Raw_Data/LE-Gal4_S11_L002_R2_001.fastq -o 3/benchmark`
```
real    182m6.569s
user    659m42.741s
sys     1m33.144s
```

# Practice for discovering the location of Gal4

1. De novo assemble the reads with `megahit`. Megahit only takes .fastq files so the .gz files need to be decompressed with `gunzip -k`.

2. Search the contigs to find the Gal4 sequence.

3. BLAST the sequence before the Gal4 sequence on the *Drosophila* genome through [NCBI](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastSearch&PROG_DEF=blastn&BLAST_PROG_DEF=megaBlast&BLAST_SPEC=OGP__7227__9554) 

# Little Tricks

### Substituting all non-English characters from input (probably copied from Microsoft Word)

Regex: `[^a-zA-Z0-9 \n.?!,;:\-\)\(\{\}\[\]'"]`

### Unbuffering Python

(This isn't related to dew-lover, but I'm just leaving here since it is beneficial)
To unbuffer the Python print statements (for e.g. when you want to see real time output when using tee `python script.py 2>&1 | tee search_output.txt`), add the line `alias python='python -u'` to .bashrc. See [this post](https://stackoverflow.com/questions/107705/disable-output-buffering) for other solutions.

### SLURM configuration file for DCC

... is stored at `less /var/spool/slurmd/conf-cache/slurm.conf`

### `scancel` a lot of jobs

`squeue -u $USER | grep 222 | awk '{print $1}' | xargs -n 1 scancel`

### Showing overall progress on `rsync`

`rsync -r --info=progress2 source destination`

### Translating from bash commands to python
`mkdir -p`:

```
    pathlib.Path(temp_dir).mkdir(parents=True, exist_ok=True)
    # os.system(f"mkdir -p {temp_dir}")
```

`rm -rf`:

```
     # os.system(f'rm -rf \'{temp_dir}\'')
     shutil.rmtree(temp_dir)
```

Finding the base directory of a folder based on where the file that was executed is:
```
file_path = os.path.realpath(__file__)
base_dir = pathlib.Path(file_path).parent.parent.absolute()
```

`rm`: 

```
	# os.system(f'rm \'{temp_1}\'')
	os.remove(temp_1)
```

### Reporting the GPU information:
`/usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery`

### Reporting usage
`sreport cluster AccountUtilizationByUser Account=biodept Users=yl708 --tres=all Start=2019-01-01 End=2023-01-01`

### Multiprocessing
```Python
from multiprocessing import Pool

def func(x):
    return x*x

if __name__ == '__main__':
    with Pool(5) as p:
        print(p.map(func, [1, 2, 3]))
```

### Debugging software packaged by Poetry:
https://github.com/python-poetry/poetry/issues/5354#issuecomment-1179074941

### Adding GIF to latex pdfs

```
ffmpeg -i collatz.mp4 -vf fps=1 out-%d.png
cp out-1.png out-0.png
```

```
\usepackage{animate}
\animategraphics[autoplay,loop,width=\linewidth]{4}{imgs/collatz-animation/out-}{0}{60}
```

### Testing network capabilities

[iperf](https://iperf.fr). UDP is apparently blocked on Duke's network.

### Filtering out folders with non-PDB names

```
ls -l | grep -E -v '\s[0-9a-z]{4}$'
```

## BLAST results:
(can be found at `data/blast/`)
- The sequence preceding LE-Gal4: 
    - very good match at 2L 19865863 to 19870949, which is located within the gene [*sick*](http://flybase.org/reports/FBgn0263873)
    - and multiple chunks in 3R?? (repeated chunks)
        - Range 1: 8293426 to 8293472
        - Range 2: 8328274 to 8328320
        - Range 3: 8331557 to 8331603
        - Range 4: 8334840 to 8334886
        - Range 5: 7782176 to 7782221 ("uncharacterized protein")
        - Range 6: 7784301 to 7784346


- The sequence preceding PAS-Gal4:
    - match for a short bit at 2L 15320802 to 15320998 (nothing)
    - multiple chunks in 3R too
        - Range 1: 8328188 to 8328320
        - Range 2: 8331471 to 8331603
        - Range 3: 8334754 to 8334886
        - Range 4: 8293426 to 8293558
        - Range 5: 7784215 to 7784346
        - Range 6: 7782176 to 7782307
        - Range 7: 8303146 to 8303254

## LE
-  Sick gene in leading edge dorsal closure: https://insitu.fruitfly.org/insitu_image_storage/img_dir_44/insitu44978.jpe

- [Insertion plasmid](http://flybase.org/reports/FBtp0000352.html)

- Look at the 3' direction of the sequence. Find the sequence further down the 3' end

    - entry for the line with the 3' end of Gal4 sequence:
    ```
    >NODE_40089_length_8717_cov_57.0000_ID_80177:NODE_118711_length_331_cov_57.5895_ID_237421',NODE_118717_length_1293_cov_33.7014_ID_237433;
    ```

    - The nodes that follow 3' end of Gal4 sequence:
    `NODE_118711_length_331_cov_57.5895_ID_237421'`
    `NODE_118717_length_1293_cov_33.7014_ID_237433`

- The plasmid that is used is 11,000 base pairs long, so I eyeballed the sequence about 8,000 base pairs downstream (because the Gal4 sequence is 3,000 base pairs long) and found the contig 108400.

- BLAST result for contig 108400:

    - 2L 19818591 to 19840659

- we chopped a repeated segment in half?

- Find the location of the unmatched part of the query.

    - Pre-plasmid sequence BLAST: 2L 19865867 to 19866718

    - Post-plasmid sequence BLAST: 2L 19865197 to 19865874

## PAS

- 10,000 bp's downstream *escargot*

- BLAST hit of Gal4 14615+

- BLASTed both the escargot and gal4 sequence. Found two hits that are next to each other, but not connected to each other. They are both led into by node 71535-. (i.e. 71535- -> 17919+, which contains escargot and 14615+, which contains gal4). 
    - Blasting 71535- shows a hit on 2L from 15313739 to 15320942.
    - Blasting 17919+ shows a hit on 2L from 15458354 to 15499966. 
        - Range 1: 15458354 to 15499966
        - Range 2: 15405321 to 15446105
        - Range 3: 15320972 to 15360909
        - Range 4: 15360908 to 15385578
        - Range 5: 15514379 to 15538814
        - Range 6: 15499999 to 15510987
        - Range 7: 15394260 to 15405293
        - Range 8: 15385604 to 15394223
        - Range 9: 15453518 to 15458313
        - Range 10: 15512320 to 15514380
        - Range 11: 15511029 to 15512301
        - Range 12: 15320802 to 15320974

- 2L:15320942-15458354 was blasted and found scattered around the assembly. There was probably bad coverage within the region.

- BLASTing 71535- [-63:] combined with 14615+ against nt yields some interesting things. Blast result file uploaded.

- On the other hand, blasting the last 50 base pairs of 71535' in an intent to find why the 141-mer assembly aligned it with 17919+ and 14615+ found only one hit on 15320893 to 15320942, which is consistent with the blast result from the entire 17919+ (i.e. it is not a repeated element).

# TODO list
- [ ] Program that highlights odd columns
- [ ] BLAST escargot sequence in PAS-Gal4 and see if it connects to the gal4. Verify the the PAS-Gal4 sequence the same way as LE-Gal4.
## TODO
- Gal4: insertion: present evidence of discovery. 
When time comes, ask for a week to prepare for presentation.

- Some quality scores in the excel sheet are pretty low. 

- Find which variants are interesting

- Pey allele and zip allele 
Pey alleles might have mutations outside of the Pey gene. 

- Might the mutation be just outside of the exons, or outside of the gene?
Could the Pey alleles be intronic variants?

- Find data source for:
Pey: always having 0/*
zip 1 S1: never having mutation

- Go into the alignment and find a polymorphism site on Pey 3.7 and see what is going on.

- Potential plan: go into the lab and use the lab computer and use tablet
brown rows: insertion?

- challenge the original vcf workflow. try other variant calling workflow? 
[vcf best practices](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-020-00791-w#Fig2)

- Find flanking sequence on PAS-Gal4 like on LE-Gal4

- balancer chromosome

- Hetereozygous in the middle of reads?

- Align to whole genome and do variant calling on region of interest

- Use extended gene region

# DONE list
- (10/21/2020) Installed Docker Engine following [this link](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository). Added `rapiduser` to usergroup `docker`. Installed [GATK's Docker image](https://hub.docker.com/r/broadinstitute/gatk/).
- (10/21/2020) Added alias `dpsa` to `~/.profile` to do shortened version of `docker ps -a` following [this blog](https://theforgetful.dev/posts/docker-ps-output-too-wide/).
- (10/23/2020) Downloaded and extracted FastQC v0.11.9 to ~
- (10/23/2020) Downloaded and extracted BBMap 38.87 to ~
- (10/23/2020) Downloaded and extracted bwa-0.7.17 to ~
- (10/23/2020) Downloaded, built samtools, bcftools and htslib 1.11 and added their bin folder to $PATH.
- (10/23/2020) Uploaded Hector's paper.
- (10/24/2020) Included VS Code tutorial to connect to VM
- (10/24/2020) Moved all the tools to the Git repository. Might consider deleting the source file and only keep the executables if we run out of space in this repository.
- (10/27/2020) Hector uploaded all the data into the Data folder. 
- (10/27/2020) Added data/* to .gitignore. Also added a generate_file_tree.sh that can generate a directory tree file for the data folder. 
- (10/30/2020) Compiled BWA
- (10/30/2020) Tried doing alignment on some files in the data repository. Found that some files might be corrupt.
- (11/4/2020) Found out that indeed the files were incompletely uploaded. Also found that the storage might not be enough for all our data. 
- (11/5/2020) Janice contacted the OIT people about adding more storage and they got us some free storage using CIFS through Duke Data Commons.
- (11/6/2020) Enabled auto mounting the data commons storage by following this [tutorial](https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/) editing the `/etc/fstab`. The 1st, 2nd and 3rd storage scratch spaces are mounted to `/dew-lover/mount/1`, `2` and `3` respectively.
- (11/13/2020) Followed [this tutorial](https://www.teknotut.com/en/install-vnc-server-with-gnome-display-on-ubuntu-18-04/) to install VNC and a desktop environment
- (11/14/2020) Made a copy of the BAM and SAM files in mount/2
- (11/30/2020) Installed RStudio server, which can be visited at {server's current address}:8787
- (11/30/2020) Added some lines to ~/.Rprofile following [this tutorial](https://www.accelebrate.com/library/how-to-articles/r-rstudio-library) to set a default library path.
- (12/2/2020) Installed anaconda to /dew-lover/anaconda3
- (12/3/2020) Downloaded a [Docker image](https://hub.docker.com/r/pegi3s/soapdenovo2/), which should allow me to use SOAPdenovo2
- (12/4/2020) Installed `megahit` and `SOAPdenovo` through conda
- (12/5/2020) Ran de novo assebmlies on LE-Gal4 and PAS-Gal4 with megahit. They have shown promising results. 
- (12/7/2020) Downloaded GATK to tools
- (12/7/2020) Installed GNU Parallel through conda
- (12/9/2020) Discussed BLAST result with Janice and Hector
- (12/16/2020) Installed `BLAST` and `bcftools` with bioconda. Deleted `tools/bcftools`.
- (12/17/2020) Installed a lot of assemblers on bioconda
- (12/17/2020) Installed `assembly-stats` for showing stats of fastq files
- (12/21/2020) Installed `bioconvert` on conda
- (12/21/2020) Aligned Stephanie's zasp data *de novo* with WENGAN. The data is deposited in `mount/3`
- (12/21/2020) Reported results of the de novo assembly with WENGAN to Stephanie and Janice. After BLASTing an arbitrary incoming and an arbitrary outgoing reads against the contigs created by WENGAN, I identified the insertion sequence (i.e. the transposable element). The results can be found at `mount/3/wengan_zasp/wengan_zasp_commented.fasta`.
- (1/7/2021) Benchmarked the virtual machine by using MEGAHIT to align a raw sequencing data of COVID-19 downloaded from the Internet. Turns out that my PC is faster than this virtual machine. Benchmark data can be found above in the *benchmark* section.
- (1/9/2021) Added a `methods` folder to store the methods used to get to the research results.
- (1/19/2021) Created a new conda environment `ref-guided-denovo` to test out the reference guided de novo assembly pipeline. Can be activated with `conda activate ref-guided-denovo`.
- (1/22/2021) Had a meeting with Hector, where we talked about progress and anomalies in variant calling of Pey and zip.
- (2/15/2021) Used Google Cloud Compute to do an assembly of the PAS data using SPADES. The output is left in `mount/3/gbucket/spades-output`
