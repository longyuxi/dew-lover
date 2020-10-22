# Dew Lover
A repository keeping the code for part of the work of Kiehart lab

## Goal of this repo:
- Keep a documentation of how we do everything, so that we can spot obvious errors, and students after us can have a place to resume the research.

## Softwares used (from Hector's paper):
- [GATK](https://www.broadinstitute.org/partnerships/education/broade/best-practices-variant-calling-gatk-1) 
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) 
- [BBMap and BDuk](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/) 
- [BWA](http://bio-bwa.sourceforge.net/) 
- [Picard Tools](http://broadinstitute.github.io/picard)
- [SAMTools](http://www.htslib.org/)
- [Docker Tutorial](https://docker-curriculum.com/)

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

# TODO list
- [ ] Bring Hector on the same page in terms of using Git and GitHub
- [ ] Set up the environment on the research toolkit
- [ ] Ask Hector if we should upload his research paper to this repo
- [x] ~~Set up [Slurm](https://slurm.schedmd.com/) or ask the IT folks about the best practice to manage jobs on Linux (because Slurm might be an overkill)~~ Just use `screen` instead.
- [x] Ask the IT folks for a "best practices" of lab computers in general
- [ ] [Terra](https://app.terra.bio/#library/showcase), a site to see the showcases of GATK
- [ ] Consider using [Docker](https://www.infoworld.com/article/3310941/why-you-should-use-docker-and-containers.html) to isolate the App

# DONE list
- (10/21/2020) Installed Docker Engine following [this link](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository). Added `rapiduser` to usergroup `docker`. Installed [GATK's Docker image](https://hub.docker.com/r/broadinstitute/gatk/).
- (10/21/2020) Added alias `dpsa` as an alias to a shortened version of `docker ps -a` following [this blog](https://theforgetful.dev/posts/docker-ps-output-too-wide/).