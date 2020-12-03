#filter unmapped reads    
${progSamtools} view -b -F 4 ${mappedAll[i]} > ${mapped[i]} # output all but those "read unmapped" to mapped[]
${progSamtools} index ${mapped[i]}

#get unmapped reads
${progSamtools} view -b -f 4 ${mappedAll[i]} > ${unmapped[i]} # output all those "read unmapped" to unmapped[]
${progSamtools} view -b -f 9 ${unmapped[i]} > ${unmapped[i]%.sorted.bam}_pair.sorted.bam # output all those "read paired" and "mate unmapped" within unmapped[] to unmapped_sorted
java -jar ${progPicard}/SamToFastq.jar INPUT=${unmapped[i]%.sorted.bam}_pair.sorted.bam FASTQ=${bowtieFailPair[i]%.fastq}.1.fastq SECOND_END_FASTQ=${bowtieFailPair[i]%.fastq}.2.fastq
rm ${unmapped[i]%.sorted.bam}_pair.sorted.bam
${progSamtools} view -b -F 8 -f 64 ${unmapped[i]} | ${progBamtools} convert -format fastq -out ${bowtieFailUnPair1[i]}  # output all the reads that are not "mate unmapped" but " first in pair" within unmapped[] to bowtiefailunpair1
${progSamtools} view -b -F 8 -f 128 ${unmapped[i]} | ${progBamtools} convert -format fastq -out ${bowtieFailUnPair2[i]}

${progBamtools} stats -in ${mappedAll[i]} >> $log
echo "--> ${mappedAll[i]}" >> $log

#filter for mapping quality >=10    
${progSamtools} view -b -q 10 ${mapped[i]} > ${mappedFiltered[i]}
${progBamtools} stats -in ${mappedFiltered[i]} >> $log
echo "--> ${mappedFiltered[i]}" >> $log