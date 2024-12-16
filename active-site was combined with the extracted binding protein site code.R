# Load necessary libraries
library(tidyverse)
library(readxl)
library(writexl)

################################### Liver Data ###################################

# Read the base file
merged_file <- read_csv("/Users/zhouhao/Documents/work/PBPK/蛋白结合/ldc5.15-liver-dy-merged-expanded-p-logabudnce.csv")

# Read the extracted active site file
active_site_file <- read_excel("/Users/zhouhao/Documents/work/PBPK/蛋白结合/active-site-dy-extracted.xlsx")

# Print sample data for checking
print("Sample of merged file:")
print(head(merged_file, 20))
print("Sample of active site file:")
print(head(active_site_file, 20))

# Rename the column in active_site_file to facilitate merging
colnames(active_site_file)[which(names(active_site_file) == "Entry")] <- "Master.Protein.Accessions.x"

# Merge data, keeping merged_file as the main dataset
final_result <- merged_file %>%
  left_join(active_site_file, by = "Master.Protein.Accessions.x")

# Print the merged result for checking
print("Final merged data:")
print(head(final_result, 20))

# Save the result to a new CSV file
output_file <- "/Users/zhouhao/Documents/work/PBPK/蛋白结合/ldc5.15-liver-dy-merged-with-active-site.csv"
write_csv(final_result, output_file)
print(paste("Data has been successfully saved to", output_file))


################################### Brain Data ###################################

# Load necessary libraries
library(tidyverse)
library(readxl)
library(writexl)

# Read the base file
merged_file <- read.csv("~/brain-gd_modification_Positions_extracted_combined.csv")

# Read the extracted active site file
active_site_file <- read_excel("~/active-site-gd-mental-extracted.xlsx")

# Print sample data for checking
print("Sample of merged file:")
print(head(merged_file, 5))
print("Sample of active site file:")
print(head(active_site_file, 5))

# Filter merged_file based on conditions matching `active_site_file`
merged_file_filtered <- merged_file %>%
  filter(`结合位点` %in% active_site_file$`Active.site` & Master.Protein.Accessions %in% active_site_file$From)

# Save the filtered result to a new CSV file
output_file <- "~/gd active sites.csv"
write_csv(merged_file_filtered, output_file)
