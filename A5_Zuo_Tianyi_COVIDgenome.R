library(rentrez) # load the rentrez packages

# According to the NCBI Id we have to download data from NCBI databases 
SARS<-entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")  
SARS

# Separate the Sequence ID with description, and sequence
header<-gsub("(^>.*genome)\\n[ATCG].*","\\1",SARS) 
seq<-gsub("^>.*genome\\n([ATCG].*)","\\1",SARS)

# remove the new line characters form sequence.
seq<-gsub("\n","",seq)


# Use regular expressions to isolate the S protein from the whole SARS genome
Sprotein <- gsub(".*(ATGTTTGTTTTTCTTGTTTTA.*GTCAAATTACATTACACATAA).*","\\1",seq)
print(paste(">S protein", Sprotein))



### Question Would you say this gene is highly conserved or evolving rapidly? Why? 
##  Yes, I would say this gene is highly conserved. According the result, I find 100 relative sequence. I find that all of these 
##sequence are in SARS-CoV-2 genome, and 100% identities.Because it all have a high alignment score,which is interpreted as LOW 
##chance of occurring by chance alone. That meas S protein sequence is highly significant alignments. Besides, the query coverage
##is 100%, which means it is 100% percentage of this sequence aligned to a sequence in gene bank. That also represents the effective
##size of this sequence been compared. In addition, the E-values is 0. E-value is the number of expected hits of similar score that 
##could be found just by chanceThe lower the E-value,the more "significant" the match is. Thus, I think this gene is highly conserved.
