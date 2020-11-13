#!/bin/bash

# output file name, read1, read2, reference
# sample command: bash align.sh --read1 data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq.gz --read2 data/Raw_Data/LE-Gal4_S11_L002_R1_002.fastq.gz --reference data/Alignments/whole_genome.fna --output-prefix data/Alignments/PAS-Gal4
# Expected files written: data/Alignments/whole_genome.fna.* , data/Alignments/whole_genome.dict, data/Alignments/PAS-Gal4.*

REFERENCE_FILE=
READ1=
READ2=
OUTPUT_PREFIX=
#### Functions
usage()
{
    echo -e "Usage: bash align.sh --read1 ... --read2 ... --reference ... --output-prefix ..."
    echo -e "Example command: bash align.sh --read1 data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq.gz --read2 data/Raw_Data/LE-Gal4_S11_L002_R1_002.fastq.gz --reference data/Alignments/whole_genome.fna --output-prefix data/Alignments/PAS-Gal4"
    echo -e "This will write files data/Alignments/whole_genome.fna.* , data/Alignments/whole_genome.dict, data/Alignments/PAS-Gal4.*"
}


while [ "$1" != "" ]; do
    case $1 in 
        --reference )   shift
                        REFERENCE_FILE="$1"
                        ;;
        --read1 )       shift
                        READ1="$1"
                        ;;
        --read2 )       shift
                        READ2="$1"
                        ;;
        --output-prefix)    shift
                            OUTPUT_PREFIX="$1"
                            ;;
        -h | --help)    usage
                        exit
                        ;;
        *)              usage
                        exit
    esac
    shift
done

