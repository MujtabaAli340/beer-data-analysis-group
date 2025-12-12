# Beer Consumption – São Paulo (2015)
# Student Analysis: Temperature vs Beer Consumption

# -----------------------------
# Load data
# -----------------------------
file_name <- if (file.exists("Beer.csv")) "Beer.csv" else "Consumo_cerveja.csv"
Beer_data <- read.csv(file_name, header = TRUE, stringsAsFactors = FALSE)

Beer <- Beer_data
