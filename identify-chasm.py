import pysam

filename = "data/Alignments/LE-Gal4_sorted.bam"
samfile = pysam.AlignmentFile(filename, "rb")

def levenshtein(a,b):
    "Calculates the Levenshtein distance between a and b."
    n, m = len(a), len(b)
    if n > m:
        # Make sure n <= m, to use O(min(n,m)) space
        a,b = b,a
        n,m = m,n
        
    current = range(n+1)
    for i in range(1,m+1):
        previous, current = current, [i]+[0]*n
        for j in range(1,n+1):
            add, delete = previous[j]+1, current[j-1]+1
            change = previous[j-1]
            if a[j-1] != b[i-1]:
                change = change + 1
            current[j] = min(add, delete, change)
            
    return current[n]

import pysam
samfile = pysam.AlignmentFile(filename, "rb" )
lev_d_dictionary = {}
current_reads = []

# i = 0 # for debug purposes

for pileupcolumn in samfile.pileup():
    print ("\ncoverage at base %s = %s" %
           (pileupcolumn.pos, pileupcolumn.n))
    last_reads = current_reads[:]
    current_reads = []
    
    # i += 1
    # if i > 10:
    #     break # for debug purposes

    for pileupread in pileupcolumn.pileups:

        if not pileupread.is_del and not pileupread.is_refskip:
            # query position is None if is_del or is_refskip is set.
            current_reads.append(pileupread.alignment.query_name)
            # print ('\tbase in read %s = %s' %
            #       (pileupread.alignment.query_name,
            #        pileupread.alignment.query_sequence[pileupread.query_position]))
    # print("Last Reads: " + str(last_reads))
    # print("Current Reads: " + str(current_reads))
    lev_d = levenshtein(last_reads,current_reads)
    print ("Lev distance between base %s and the base before = %s" %
           (pileupcolumn.pos, lev_d))
    lev_d_dictionary[pileupcolumn.pos] = lev_d

samfile.close()

with open('chasm.txt', 'w') as output_file:
    for w in sorted(lev_d_dictionary, key=lev_d_dictionary.get, reverse=True):
        print(w, lev_d_dictionary[w])
        output_file.write(','.join((str(w), str(lev_d_dictionary[w]))) + '\n')