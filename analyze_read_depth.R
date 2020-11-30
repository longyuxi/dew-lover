setwd("/dew-lover")  # working path
coverage=read.table("mount/2/LE-Gal4_sorted.coverage", sep="\t", header=F)
library(reshape)
coverage=rename(coverage,c(V1="Chr", V2="locus", V3="depth")) # renames the header
ggplot(coverage, aes(x=locus, y=depth)) +
  geom_point(colour="red", size=1, shape=20, alpha=1/3) +
  scale_y_continuous(trans = scales::log10_trans(), breaks = scales::trans_breaks("log10", function(x) 10^x))