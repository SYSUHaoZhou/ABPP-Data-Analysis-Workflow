# Import necessary libraries
library(ggplot2)
library(dplyr)

# Function to process data and generate plots
process_and_plot <- function(file_path, x_col, y_col, output_title, color1, color2) {
  # Load data
  data <- read.csv(file_path)
  df <- data
  
  # Check column names
  print(names(df))
  
  # Ensure x_col and y_col are numeric
  df[[x_col]] <- as.numeric(as.character(df[[x_col]]))
  df[[y_col]] <- as.numeric(as.character(df[[y_col]]))
  
  # Generate the fourth column
  df$FourthColumn <- with(df, ifelse(df[[x_col]] < -1 & df[[y_col]] > 2, "DOWN", NA))
  
  # Plot using geom_jitter to display overlapping values
  p <- ggplot(data = df, aes_string(x = x_col, y = y_col)) +
    geom_jitter(
      aes(color = FourthColumn),  # Color mapping
      alpha = 0.25, size = 2.5,
      width = 0.1, height = 0.1  # Adjust jitter range
    ) +
    ylab(paste0("-lg(P( (", output_title, ") / (CTRL))")) +
    xlab(paste0("log2( (", output_title, ") / (CTRL))")) +
    scale_color_manual(values = c(color1, color2)) +
    geom_vline(xintercept = c(-1, 1), lty = 4, col = "#808080", lwd = 0.8) +
    geom_hline(yintercept = 2, lty = 4, col = "#808080", lwd = 0.8) +
    theme_classic() +
    ggtitle(paste(output_title, "Peptide Groups")) +
    theme(
      plot.title = element_text(size = 12, hjust = 0.5),
      legend.title = element_blank()
    )
  
  # Print plot
  print(p)
}

# File paths
liver_paths <- list(
  Tb = "~/liver/tb.csv",
  Y = "~/liver-y.csv",
  Gd = "~/liver-gd1.csv",
  Dy = "~/liver-Dy.csv"
)

brain_paths <- list(
  Tb = "~/BRAIN-tb.csv",
  Y = "~/-BRAIN-y.csv",
  Gd = "~/BRAIN-gd.csv",
  Dy = "~/BRAIN-dy.csv"
)

# Process and plot liver data
process_and_plot(liver_paths$Tb, "TbA", "TbP", "Tb", "#840000", "#808080")
process_and_plot(liver_paths$Y, "YA", "YP", "Y", "#008c82", "#808080")
process_and_plot(liver_paths$Gd, "GdA", "GdP", "Gd", "#3e5380", "#808080")
process_and_plot(liver_paths$Dy, "DyA", "DyP", "Dy", "#7262ac", "#808080")

# Process and plot brain data
process_and_plot(brain_paths$Tb, "log2AbundanceTb", "log10PTb", "Tb in Brain", "#840000", "#808080")
process_and_plot(brain_paths$Y, "log2AbundanceY", "log10PY", "Y in Brain", "#008c82", "#808080")
process_and_plot(brain_paths$Gd, "log2AbundanceGd", "log10PGd", "Gd in Brain", "#3e5380", "#808080")
process_and_plot(brain_paths$Dy, "log2AbundanceDy", "log10PDy", "Dy in Brain", "#7262ac", "#808080")
