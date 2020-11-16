import pysam

filename = "data/Alignments/LE-Gal4.bam"
samfile = pysam.AlignmentFile(filename, "rb")