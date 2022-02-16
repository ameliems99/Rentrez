library(rentrez)
SARSgen <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")  #import SARS-CoV-2 ref genome from the ncbi nucleotide database
SARSgen <- unlist(SARSgen)  #transform reference genome to vector
SARSgen <- gsub("\n", "", SARSgen)  #remove newline characters
SARSgen <- gsub(".*(ATGTTTGTTTTTCTTGTTTTA.*GTCAAATTACATTACACATAA).*", "\\1", SARSgen)  #isolate spike protein
print(SARSgen)  #print spike protein, copy to BLAST in web browser

#The SARS-CoV-2 spike protein is highly conserved. The expect-value is 0 for the top 100 hits, 
#meaning it is highly improbable that we would match these queries by chance. 
#More importantly, the percent identity is 100% for the top 97 hits, 
#and the alignment shows that every single nucleotide in these 97 sequences is the same. 