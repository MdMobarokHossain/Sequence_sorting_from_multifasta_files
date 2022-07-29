#!/usr/bin/env Rscript

library(seqinr)

seqs <- read.fasta("final.fasta")
locs <- read.delim("final.coords", header=F, sep=" ") #if the file tabdelimated then use sep="\t"
outf <- file("a001-results.fasta", 'w')

doitall <- function(x) {
  seq_id <- x[[1]]; start <- x[[2]]; stop <- x[[3]]; seq <- seqs[[seq_id]]
  seqv   <- seq[start:stop]
  header <- paste(sep="", ">", attr(seq, "name"), "_", start, "_", stop, "\n")
  cat(file=outf, header)
  cat(file=outf, toupper(paste(sep="", collapse="", seqv)), "\n")
}
apply(locs, 1, doitall)
close(outf)
