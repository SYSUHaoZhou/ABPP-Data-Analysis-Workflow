# Load necessary libraries
library(tidyverse)
library(readxl)

# Read the CSV file
df <- read.csv("~/brain-gd differ protein.csv")

# Assuming the column to split is "Master.Protein.Accessions"
# If the actual column name differs, replace "Master.Protein.Accessions" with the correct name
df_separated <- df %>%
  separate_rows(Master.Protein.Accessions, sep = "; ")

# Save the separated result to a new CSV file
output_file <- "~/brain-gd differ protein-separated.csv"
write.csv(df_separated, output_file, row.names = FALSE)

print(paste("Data has been successfully separated and saved to", output_file))
