library(tidyverse)

########################################### Step 1: Extract Modifications ###########################################################

# Read the data
data <- read.csv("~/liver-gd.csv", stringsAsFactors = FALSE)

# Print a sample of the Modifications column
print("Sample of Modifications column:")
print(head(data$Modifications, 20))

# Extract numbers from the Modifications column
modifications_extract <- data %>%
  separate_rows(Modifications, sep = "; ") %>%
  mutate(site = str_extract_all(Modifications, "(?<=DBIA1 \\[C)\\d+")) %>%
  unnest(site) %>%
  select(Master.Protein.Accessions, site, number) %>%
  filter(!is.na(site))

# Print the extracted modifications
print("Modifications extract result:")
print(head(modifications_extract, 20))

# Save the extracted modifications to a new CSV file
write.csv(modifications_extract, "~/liver-gd-modifications.csv", row.names = FALSE)
print("Modifications extract result saved to 'ldc5.15-liver-gd-modifications.csv'.")

########################################### Step 2: Extract Positions in Master Proteins ############################################

# Extract numbers from the Positions in Master Proteins column
positions_extract <- data %>%
  separate_rows(Positions.in.Master.Proteins, sep = "; ") %>%
  mutate(start = str_extract(Positions.in.Master.Proteins, "(?<=\\[)\\d+(?=-)")) %>%
  select(Master.Protein.Accessions, start, number) %>%
  filter(!is.na(start))

# Print the extracted positions
print("Positions in Master Proteins extract result:")
print(head(positions_extract, 20))

# Save the extracted positions to a new CSV file
write.csv(positions_extract, "~/liver-gd-positions.csv", row.names = FALSE)
print("Positions extract result saved to 'ldc5.15-liver-gd-positions.csv'.")

########################################### Step 3: Merge Modifications and Positions ###############################################

# Read the two extracted CSV files
positions <- read.csv("~/liver-gd-positions.csv", stringsAsFactors = FALSE)
modifications <- read.csv("~/liver-gd-modifications.csv", stringsAsFactors = FALSE)

# Print samples of the files
print("Sample of Positions file:")
print(head(positions, 20))
print("Sample of Modifications file:")
print(head(modifications, 20))

# Merge the data
merged_data <- positions %>%
  left_join(modifications, by = "number") %>%
  arrange(number)

# Print the merged data
print("Merged data result:")
print(head(merged_data, 20))

# Save the merged result to a new CSV file
write.csv(merged_data, "~/liver-gd-merged.csv", row.names = FALSE)
print("Merged data saved to 'ldc5.15-liver-gd-merged.csv'.")

########################################### Step 4: Expand and Remove Duplicate Rows ###############################################

# Read the merged CSV file
merged_file <- read.csv("~/liver-gd-merged.csv", stringsAsFactors = FALSE)

# Print a sample of the merged file
print("Sample of merged file:")
print(head(merged_file, 20))

# Separate multiple protein IDs into multiple rows
expanded_merged_file <- merged_file %>%
  separate_rows(Master.Protein.Accessions.x, sep = ";") %>%
  mutate(Master.Protein.Accessions.x = str_trim(Master.Protein.Accessions.x))

# Remove duplicate rows
expanded_merged_file <- expanded_merged_file %>%
  distinct()

# Print the expanded and de-duplicated file
print("Expanded merged file without duplicates:")
print(head(expanded_merged_file, 20))

# Save the final expanded and de-duplicated result to a new CSV file
output_file <- "~/liver-gd-merged-expanded.csv"
write.csv(expanded_merged_file, output_file, row.names = FALSE)
print(paste("Data has been successfully saved to", output_file))
