# Dew Lover
A repository keeping the code for part of the work of Kiehart lab

## Softwares used (from Hector's paper):
- [GATK](https://www.broadinstitute.org/partnerships/education/broade/best-practices-variant-calling-gatk-1) 
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) 
- [BBMap and BBDuk](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/) 
- [BWA](http://bio-bwa.sourceforge.net/) 
- [Picard Tools](http://broadinstitute.github.io/picard)
- [SAMTools](http://www.htslib.org/)

## Interesting commands and webpages
- [Common Linux commands](https://help.ubuntu.com/community/UsingTheTerminal) and [all-in-one collection of shortcuts](https://kapeli.com/cheat_sheets/Bash_Shortcuts.docset/Contents/Resources/Documents/index)
- [Using bash history](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)
- `less`: perhaps one of the most important commands ([intro](https://linuxize.com/post/less-command-in-linux/))
- `command > /dev/null 2>&1 &`: redirect stdout to `/dev/null` and `stderr` to stdout, and runs `command` in the background
- `vim`: best text editor (use `vimtutor` to learn)
- `screen`: opens an alternate terminal "screen" that functions exactly like what you would expect for a screen ([intro](https://linuxize.com/post/how-to-use-linux-screen/)) ([how to kill a screen session](https://stackoverflow.com/questions/1509677/kill-detached-screen-session)).
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- `[Ctrl + K] + V` in VS Code to show Markdown preview after installing the extensions Markdown All in One and Markdown Preview enhanced
- [Mega collection of bioinformatics resources](https://github.com/jdidion/biotools)
- [PacBio Bioinformatics Training Wiki](https://github.com/PacificBiosciences/Bioinformatics-Training/wiki)
- [Other ways to run a process in the background](https://linuxize.com/post/how-to-run-linux-commands-in-background/)

# TODO list
- [ ] Bring Hector on the same page in terms of using Git and GitHub
- [ ] Set up the environment on the research toolkit
- [ ] Ask Hector if we should upload his research paper to this repo
- [x] ~~Set up [Slurm](https://slurm.schedmd.com/) or ask the IT folks about the best practice to manage jobs on Linux (because Slurm might be an overkill)~~ Just use `screen` instead.
- [ ] Ask the IT folks for a "best practices" of lab computers in general
- [ ] [Terra](https://app.terra.bio/#library/showcase), a site to see the showcases of GATK