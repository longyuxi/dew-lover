#!/bin/bash

# output file name, read1, read2, reference
# sample command: bash align.sh --read1 data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq.gz --read2 data/Raw_Data/LE-Gal4_S11_L002_R1_002.fastq.gz --reference data/Alignments/whole_genome.fna --output-prefix data/Alignments/PAS-Gal4
# Expected files written: data/Alignments/whole_genome.fna.* , data/Alignments/whole_genome.dict, data/Alignments/PAS-Gal4.*

##### Commands that will be run from this input in sequence...ha that's a pun!:
##
## Reference genome handling
# /dew-lover/tools/bwa-0.7.17/bwa index data/Alignments/whole_genome.fna
### Creates whole_genome.fna.amb whole_genome.fna.ann whole_genome.fna.bwt whole_genome.fna.pac whole_genome.fna.sa
# /dew-lover/tools/samtools-1.11/samtools faidx data/Alignments/whole_genome.fna
### Creates whole_genome.fna.fai
# java -jar /dew-lover/tools/picard.jar CreateSequenceDictionary  REFERENCE=data/Alignments/whole_genome.fna  OUTPUT=data/Alignments/whole_genome.dict
### Creates whole_genome.dict
##
## Alignment
# /dew-lover/tools/bwa-0.7.17/bwa mem data/Alignments/whole_genome.fna in1=data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq.gz in2=data/Raw_Data/LE-Gal4_S11_L002_R1_002.fastq.gz > data/Alignments/PAS-Gal4.sam
# /dew-lover/tools/samtools-1.11/samtools view -S -b data/Alignments/PAS-Gal4.sam > data/Alignments/PAS-Gal4.bam
# /dew-lover/tools/samtools-1.11/samtools sort data/Alignments/PAS-Gal4.bam -o data/Alignments/PAS-Gal4_sorted.bam
# /dew-lover/tools/samtools-1.11/samtools index data/Alignments/PAS-Gal4_sorted.bam

REFERENCE_FILE=
READ1=
READ2=
OUTPUT_PREFIX=
NUMBER_OF_THREADS=3
#### Functions
usage()
{
    echo -e "Usage: bash align.sh --read1 ... --read2 ... --reference ... --output-prefix ... [--threads ...]"
    echo -e "Example command: bash align.sh --read1 data/Raw_Data/LE-Gal4_S11_L002_R1_001.fastq.gz --read2 data/Raw_Data/LE-Gal4_S11_L002_R2_001.fastq.gz --reference data/Alignments/whole_genome.fna --output-prefix data/Alignments/LE-Gal4"
    echo -e "This will write files data/Alignments/whole_genome.fna.* , data/Alignments/whole_genome.dict, data/Alignments/PAS-Gal4.*"
}

# Checks if any of the critical inputs are not specified
input_check()
{
    if [ -z "$REFERENCE_FILE" ] || [ -z "$READ1" ] || \
        [ -z "$READ2" ] || [ -z "$OUTPUT_PREFIX" ]; then
        echo "At least one critical parameter not specified."
        usage
        exit 1
    fi

    # Checks if the reference file name has an extension, otherwise my potato code might not run. This conditional checks for it
    # If input directory contains dots,  my potato code might also not run. This conditional doesn't check for it
    if [[ ! $REFERENCE_FILE =~ [.][0-9a-zA-Z]+ ]]; then
        echo "Please add an extension to the reference file"
        exit 1
    fi

    # Check if NUMBER_OF_THREADS is an integer
    re='^[0-9]+$'
    if ! [[ $NUMBER_OF_THREADS =~ $re ]] ; then
        echo "error: Number of threads is not a number" >&2; exit 1
    fi

}

create_reference_files()
{
    if [ -e "$REFERENCE_FILE.amb" ]; then
        echo "$REFERENCE_FILE.amb exists"
    else
        echo "Generating $REFERENCE_FILE.amb..."
        /dew-lover/tools/bwa-0.7.17/bwa index "$REFERENCE_FILE"
    fi

    if [ -e "$REFERENCE_FILE.fai" ]; then
        echo "$REFERENCE_FILE.fai exists"
    else
        echo "Generating $REFERENCE_FILE.fai..."
        /dew-lover/tools/samtools-1.11/samtools faidx "$REFERENCE_FILE"
    fi

    if [ -e "${REFERENCE_FILE%.*}.dict" ]; then
        echo "${REFERENCE_FILE%.*}.dict exists"
    else
        echo "Generating ${REFERENCE_FILE%.*}.dict..."
        java -jar /dew-lover/tools/picard.jar CreateSequenceDictionary  REFERENCE="$REFERENCE_FILE"  OUTPUT="${REFERENCE_FILE%.*}.dict"
    fi

}

generate_sam()
{
    echo "Generating SAM..."
    /dew-lover/tools/bwa-0.7.17/bwa mem -t $NUMBER_OF_THREADS "$REFERENCE_FILE" "$READ1" "$READ2" > "$OUTPUT_PREFIX.sam"
}

generate_bam_from_sam()
{
    echo "Generating BAM from SAM..."
    /dew-lover/tools/samtools-1.11/samtools view -@ $NUMBER_OF_THREADS -S -b "$OUTPUT_PREFIX.sam" > "$OUTPUT_PREFIX.bam"
    /dew-lover/tools/samtools-1.11/samtools sort -@ $NUMBER_OF_THREADS "${OUTPUT_PREFIX}.bam" -o "${OUTPUT_PREFIX}_sorted.bam"
    /dew-lover/tools/samtools-1.11/samtools index "${OUTPUT_PREFIX}_sorted.bam"

    echo "Removing original SAM file"
    rm "$OUTPUT_PREFIX.sam"
    echo "Removed original SAM file"

    echo "Removing unsorted BAM file"
    rm "$OUTPUT_PREFIX.bam"
    echo "Removed unsorted BAM file"
}

#### Main
# Read inputs
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
        -t | --threads) shift
                        NUMBER_OF_THREADS=$1
                        ;;
        -h | --help)    usage
                        exit
                        ;;
        *)              usage
                        exit
    esac
    shift
done

input_check
create_reference_files
generate_sam
generate_bam_from_sam