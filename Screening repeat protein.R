library(tidyverse)

# Read the data
data <- read.csv("~/-liver-tb-merged-with-active-site.csv", stringsAsFactors = FALSE)

# Print a sample of the original data
print("Sample of the original file:")
print(head(data, 20))

# Filter rows where `Active_site_numbers` equals `sum`
filtered_data <- data %>%
  filter(Active_site_numbers == sum)

# Print the filtered data for inspection
print("Filtered data result:")
print(head(filtered_data, 20))

# Save the filtered data to a new CSV file
output_file <- "~/liver-tb-merged-with-active-site-filtered.csv"
write.csv(filtered_data, output_file, row.names = FALSE)
print(paste("Filtered data has been successfully saved to", output_file))
