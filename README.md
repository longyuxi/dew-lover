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

# TODO list
- [ ] Bring Hector on the same page in terms of using Git and GitHub
- [ ] Joey running a similar thing. Check his documents out. Janice is going to send them.
- [x] Mark all the "fishy" rows in zip.xlsx and upload to server
- [x] Figure out how to use IGB or Tablet on server
- [x] Finish the execution of PAS
- [x] Create script to execute everything (input: output file name, read1, read2, reference) (delete the sam file after creating the bam file)
- [ ] Program that highlights odd columns
- [ ] Something around 220,000 is weird
- [ ] 114279
- [ ] 123373
- [ ] 2803637
- [ ] 1040981 Probably an insertion
- [ ] 1073959

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