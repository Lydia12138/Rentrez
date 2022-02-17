ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # create a vector with NCBI Id.

library(rentrez) # load the rentrez packages

Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # According to the NCBI Id we have to download data from NCBI databases 

Sequences <- strsplit(Bburg, split = "\n\n", fixed = T) # split "Bburg" into three elements, and each elements contains one sequence
Sequences <- unlist(Sequences) # used to convert a list to vector
Sequences

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) # create a new vector with NCBI Id and description
header
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) # create a new vector with specific sequences
seq
seq<-gsub("\n","",seq) # remove the new line characters in seq vector. 

Sequences<-data.frame(Name=header,Sequence=seq) #create a new data frame with NCBI ID, description, and sequences

write.csv(Sequences, "output/Sequences.csv", row.names = FALSE) # Output the data named Sequences to a filed called Sequences. csv

