library(tidyverse)
library(readxl)
library(writexl)
library(dplyr)
library(tidyr)

# Read the xlsx file
active_site_file <- read_excel("~/total active sites.xlsx")

# Print sample data for inspection
print("Sample of active site file:")
print(head(active_site_file, 20))

# Print column names
print("Columns in active site file:")
print(colnames(active_site_file))

# Ensure column names are correct and extract numbers from the "Active site" column
active_site_extracted <- active_site_file %>%
  mutate(Active_site_numbers = str_extract_all(`Active site`, "\\d+")) %>%
  unnest(Active_site_numbers) %>%
  select(Entry, Active_site_numbers)

# Print extracted results for inspection
print("Extracted active site numbers:")
print(head(active_site_extracted, 20))

# Save the extracted data to a new xlsx file
output_file <- "~/active-site-all-mental-extracted.xlsx"
write_xlsx(active_site_extracted, output_file)
print(paste("Data has been successfully saved to", output_file))

######################### Extraction of brain protein active sites #########################
# Load necessary libraries
library(readxl)
library(dplyr)
library(stringr)

# Read the csv file
active_site_file <- read.csv("~/dy active sites.csv")

# Print sample data for inspection
print("Sample of active site file:")
print(head(active_site_file, 3))

# Print column names
print("Columns in active site file:")
print(colnames(active_site_file))

# Ensure column names are correct and extract numbers from the "Active site" column
selected_data <- active_site_file %>%
  dplyr::select(`From`, `Protein.names`, `Gene.Names`, `Active.site`) %>%
  mutate(`Active.site` = str_extract(`Active.site`, "\\d+"))

# Print the processed data
print("Processed data:")
print(selected_data)

# Save the processed data to a new xlsx file
output_file <- "~/active-site-dy-mental-extracted.xlsx"
write_xlsx(selected_data, output_file)
print(paste("Data has been successfully saved to", output_file))
