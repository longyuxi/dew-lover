setwd("/dew-lover")  # working path
coverage=read.table("mount/2/LE-Gal4_sorted.coverage", sep="\t", header=F)
library(reshape)
library(ggplot2)
library(plyr)
coverage=rename(coverage,c(V1="Chr", V2="locus", V3="depth")) # renames the header

depth_dist <- count(coverage, "depth")

# Counts the number of bases where the read depth is smaller than 60
ct <- 0
for (row in 1:nrow(depth_dist)){
  if(row < 60){
    ct <- ct + depth_dist[row, "freq"]
  }
}
ct

ggplot(depth_dist, aes(depth, freq)) +
  geom_line() +
  scale_x_log10()

median(depth_dist$freq)

# depth_dist: 28% < 60, average = 74, median = 20