# Load necessary libraries
library(readxl)
library(dplyr)
library(tidyr)

# Read the Excel file
merged_file <- read_excel("~/IPA-y.xlsx")

# Print a sample of the merged file for inspection
print("Sample of merged file:")
print(head(merged_file, 20))

# Split the "Master Protein Accessions" column into multiple rows, keeping other columns consistent
expanded_merged_file <- merged_file %>%
  mutate(`Master Protein Accessions` = str_split(`Master Protein Accessions`, ";")) %>% # Split column into list
  unnest(cols = `Master Protein Accessions`) %>% # Expand list into multiple rows
  distinct() # Remove duplicate rows

# Print the processed data for inspection
print("Expanded merged file without duplicates:")
print(head(expanded_merged_file, 20))

# Save the processed data to a new CSV file
output_file <- "~/IPA-y-expanded.csv"
write.csv(expanded_merged_file, output_file, row.names = FALSE)
print(paste("Data has been successfully saved to", output_file))
