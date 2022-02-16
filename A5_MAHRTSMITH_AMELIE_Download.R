library(rentrez)
ncbi_ids <- c("HQ433692.1", "HQ433694.1", "HQ433691.1")  #create a vector of IDs for the records we want
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")  #import these records from the ncbi nucleotide database ('nuccore') in fasta format 
Sequences <- unlist(strsplit(Bburg, split = "\n\n"))  #create a new  object with a separate element for each sequence
header <- gsub("(^>.*sequence)\\n[ATCG].*", "\\1", Sequences)  #extract header
seq <- gsub("^>.*sequence\\n([ATCG].*)", "\\1", Sequences)  #extract sequence
seq <- gsub("\\n", "", seq)  #remove newline characters from sequence
Sequences <- data.frame(Name = header, Sequence = seq)  #create data frame 
write.csv(Sequences, "A5_MAHRTSMITH_AMELIE_Sequences.csv", row.names = FALSE)  #output data frame to new file