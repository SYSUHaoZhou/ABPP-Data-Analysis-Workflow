#################################### Liver ####################################
#################################### GD and Y ################################

library(tidyverse)

# Read the data
data <- read.csv("~/ldc5.15-liver-y.csv", stringsAsFactors = FALSE)

# Print sample data from the "Modifications" column
print("Sample of Modifications column:")
print(head(data$Modifications, 20))

# Step 1: Extract numbers from the "Modifications" column
modifications_extract <- data %>%
  separate_rows(Modifications, sep = "; ") %>%
  mutate(site = str_extract_all(Modifications, "(?<=DBIA1 \\[C)\\d+")) %>%
  unnest(site) %>%
  select(Master.Protein.Accessions, site, number, YA, P) %>%
  filter(!is.na(site))

# Print extraction results
print("Modifications extract result:")
print(head(modifications_extract, 20))

# Save the first result to a new CSV file
write.csv(modifications_extract, "~/ldc5.15-liver-y-modifications.csv", row.names = FALSE)
print("Modifications extract result saved to 'ldc5.15-liver-y-modifications.csv'.")

# Step 2: Extract numbers from the "Positions in Master Proteins" column
positions_extract <- data %>%
  separate_rows(Positions.in.Master.Proteins, sep = "; ") %>%
  mutate(start = str_extract(Positions.in.Master.Proteins, "(?<=\\[)\\d+(?=-)")) %>%
  select(Master.Protein.Accessions, start, number, YA, P) %>%
  filter(!is.na(start))

# Print extraction results
print("Positions in Master Proteins extract result:")
print(head(positions_extract, 20))

# Save the second result to a new CSV file
write.csv(positions_extract, "~/ldc5.15-liver-y-positions.csv", row.names = FALSE)
print("Positions extract result saved to 'ldc5.15-liver-y-positions.csv'.")

# Merge the two extracted files
positions <- read.csv("~/ldc5.15-liver-y-positions.csv", stringsAsFactors = FALSE)
modifications <- read.csv("~/ldc5.15-liver-y-modifications.csv", stringsAsFactors = FALSE)

# Print sample data from the positions and modifications files
print("Sample of Positions file:")
print(head(positions, 20))
print("Sample of Modifications file:")
print(head(modifications, 20))

# Merge the data
merged_data <- positions %>%
  left_join(modifications, by = "number") %>%
  arrange(number)

# Print merged data
print("Merged data result:")
print(head(merged_data, 20))

# Save the merged result to a new CSV file
write.csv(merged_data, "~/ldc5.15-liver-y-merged.csv", row.names = FALSE)
print("Merged data saved to 'ldc5.15-liver-y-merged.csv'.")

# Expand rows with multiple protein IDs
merged_file <- read.csv("~/ldc5.15-liver-y-merged.csv", stringsAsFactors = FALSE)
expanded_merged_file <- merged_file %>%
  separate_rows(Master.Protein.Accessions.x, sep = ";") %>%
  mutate(Master.Protein.Accessions.x = str_trim(Master.Protein.Accessions.x)) %>%
  distinct()

# Print expanded and de-duplicated data
print("Expanded merged file without duplicates:")
print(head(expanded_merged_file, 20))

# Save the expanded result
output_file <- "~/ldc5.15-liver-y-merged-expanded-p-logabudnce.csv"
write.csv(expanded_merged_file, output_file, row.names = FALSE)
print(paste("Data has been successfully saved to", output_file))

#################################### TB and DY ################################

library(tidyverse)

# Read the data
data <- read.csv("~/ldc5.15-liver-dy.csv", stringsAsFactors = FALSE)

# Print sample data from the "Modifications" column
print("Sample of Modifications column:")
print(head(data$Modifications, 20))

# Step 1: Extract numbers from the "Modifications" column
modifications_extract <- data %>%
  separate_rows(Modifications, sep = "; ") %>%
  mutate(site = str_extract_all(Modifications, "(?<=DBIA \\[C)\\d+")) %>%
  unnest(site) %>%
  select(Master.Protein.Accessions, site, number, DyA, P) %>%
  filter(!is.na(site))

# Print extraction results
print("Modifications extract result:")
print(head(modifications_extract, 20))

# Save the first result to a new CSV file
write.csv(modifications_extract, "~/ldc5.15-liver-dy-modifications.csv", row.names = FALSE)
print("Modifications extract result saved to 'ldc5.15-liver-dy-modifications.csv'.")

# Step 2: Extract numbers from the "Positions in Master Proteins" column
positions_extract <- data %>%
  separate_rows(Positions.in.Master.Proteins, sep = "; ") %>%
  mutate(start = str_extract(Positions.in.Master.Proteins, "(?<=\\[)\\d+(?=-)")) %>%
  select(Master.Protein.Accessions, start, number, DyA, P) %>%
  filter(!is.na(start))

# Print extraction results
print("Positions in Master Proteins extract result:")
print(head(positions_extract, 20))

# Save the second result to a new CSV file
write.csv(positions_extract, "~/ldc5.15-liver-dy-positions.csv", row.names = FALSE)
print("Positions extract result saved to 'ldc5.15-liver-dy-positions.csv'.")

# Merge the two extracted files
positions <- read.csv("~/ldc5.15-liver-dy-positions.csv", stringsAsFactors = FALSE)
modifications <- read.csv("~/ldc5.15-liver-dy-modifications.csv", stringsAsFactors = FALSE)

# Print sample data from the positions and modifications files
print("Sample of Positions file:")
print(head(positions, 20))
print("Sample of Modifications file:")
print(head(modifications, 20))

# Merge the data
merged_data <- positions %>%
  left_join(modifications, by = "number") %>%
  arrange(number)

# Print merged data
print("Merged data result:")
print(head(merged_data, 20))

# Save the merged result to a new CSV file
write.csv(merged_data, "~/ldc5.15-liver-dy-merged.csv", row.names = FALSE)
print("Merged data saved to 'ldc5.15-liver-dy-merged.csv'.")

# Expand rows with multiple protein IDs
merged_file <- read.csv("~/ldc5.15-liver-dy-merged.csv", stringsAsFactors = FALSE)
expanded_merged_file <- merged_file %>%
  separate_rows(Master.Protein.Accessions.x, sep = ";") %>%
  mutate(Master.Protein.Accessions.x = str_trim(Master.Protein.Accessions.x)) %>%
  distinct()

# Print expanded and de-duplicated data
print("Expanded merged file without duplicates:")
print(head(expanded_merged_file, 20))

# Save the expanded result
output_file <- "~/ldc5.15-liver-dy-merged-expanded-p-logabudnce.csv"
write.csv(expanded_merged_file, output_file, row.names = FALSE)
print(paste("Data has been successfully saved to", output_file))

################################################## Brain ##############################################

library(tidyverse)

# Read the data
data <- read.csv("~/Brain/brain-tb-differential-proteins.csv", stringsAsFactors = FALSE)

# Print sample data from the "Modifications" column
print("Sample of Modifications column:")
print(head(data$Modifications, 5))

# Extract numbers from the "Modifications" column
extract_and_expand <- function(df) {
  df %>%
    rowwise() %>%
    mutate(numbers = list(gsub("C", "", unlist(regmatches(Modifications, gregexpr("C\\d+", Modifications)))))) %>%
    unnest(numbers) %>%
    mutate(Modifications = numbers) %>%
    dplyr::select(-numbers)
}

# Apply the function
expanded_df <- extract_and_expand(data)

# Print expanded data
print(expanded_df)

# Save expanded data to a new CSV file
write.csv(expanded_df, "~/Brain/brain-tb-differential-proteins_modification.csv", row.names = FALSE)

# Extract position information from the "Positions in Master Proteins" column
extract_position <- function(s) {
  matches <- regmatches(s, regexec("\\[(\\d+)", s))
  as.numeric(matches[[1]][2])
}

expanded_df$Extracted_Position <- sapply(expanded_df$Positions.in.Master.Proteins, extract_position)

# Save the modified DataFrame
new_file_path <- "~/Brain/brain-tb-differential-proteins_modification_Positions_extracted.csv"
write.csv(expanded_df, new_file_path, row.names = FALSE)

# Combine "Modifications" and "Extracted_Position"
expanded_df$Modifications <- as.numeric(expanded_df$Modifications)
expanded_df$Binding_Site <- expanded_df$Modifications + expanded_df$Extracted_Position - 1

# Save the final combined DataFrame
new_file_path <- "~/Brain/brain-tb-differential-proteins_modification_Positions_extracted_combined.csv"
write.csv(expanded_df, new_file_path, row.names = FALSE)
