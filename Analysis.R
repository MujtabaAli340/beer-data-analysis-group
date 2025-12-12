# Beer Consumption – São Paulo (2015)
# Student Analysis: Temperature vs Beer Consumption

# -----------------------------
# Load data
# -----------------------------
file_name <- if (file.exists("Beer.csv")) "Beer.csv" else "Consumo_cerveja.csv"
Beer_data <- read.csv(file_name, header = TRUE, stringsAsFactors = FALSE)

Beer <- Beer_data

# -----------------------------
# Clean numeric columns
# -----------------------------
# Handle comma decimals and different column name versions

# Maximum temperature
if ("Temperatura.Maxima..C." %in% names(Beer)) {
  Beer$Temperatura.Maxima..C. <- as.numeric(gsub(",", ".", as.character(Beer$Temperatura.Maxima..C.)))
}

# Average temperature (two possible names)
if ("Temperatura.Media..C" %in% names(Beer)) {
  Beer$Temperatura.Media..C <- as.numeric(gsub(",", ".", as.character(Beer$Temperatura.Media..C)))
}
if ("Temperatura.Media..C." %in% names(Beer)) {
  Beer$Temperatura.Media..C. <- as.numeric(gsub(",", ".", as.character(Beer$Temperatura.Media..C.)))
}

# Beer consumption
if ("Consumo.de.cerveja..litros." %in% names(Beer)) {
  Beer$Consumo.de.cerveja..litros. <- as.numeric(gsub(",", ".", as.character(Beer$Consumo.de.cerveja..litros.)))
}
if ("Consumo.de.cerveja..litros" %in% names(Beer)) {
  Beer$Consumo.de.cerveja..litros <- as.numeric(gsub(",", ".", as.character(Beer$Consumo.de.cerveja..litros)))
}

# Use one beer consumption column consistently
if (!("Consumo.de.cerveja..litros" %in% names(Beer))) {
  Beer$Consumo.de.cerveja..litros <- Beer$Consumo.de.cerveja..litros.
}
