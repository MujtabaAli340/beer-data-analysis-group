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

# Detect correct average temperature column
if ("Temperatura.Media..C" %in% names(Beer)) {
  avg_temp <- Beer$Temperatura.Media..C
} else {
  avg_temp <- Beer$Temperatura.Media..C.
}

# -----------------------------
# Scatter plots
# -----------------------------
x <- Beer$Temperatura.Maxima..C.
y <- Beer$Consumo.de.cerveja..litros

ok <- is.finite(x) & is.finite(y) & is.finite(avg_temp)
x <- x[ok]
y <- y[ok]
avg_temp <- avg_temp[ok]

model <- lm(y ~ x)

cat("Pearson correlation test (temperature vs beer consumption)\n")
print(cor.test(x, y, method = "pearson"))

cat("\nLinear regression summary (y ~ x)\n")
print(summary(model))

# Scatter plot (no regression line)
plot(x, y,
     main = "Scatter plot: Beer consumption and Temperature.",
     xlab = "Temperture in Celsius",
     ylab = "Beer Consumption in liters",
     pch = 1)

# Scatter plot with regression line
plot(x, y,
     main = "Correlation between beer consumption and temperature",
     xlab = "Temperature (°C)",
     ylab = "Beer Consumption in liters",
     pch = 12,
     col = "black",
     xlim = c(10, 40),
     ylim = c(10, 40))

axis(2, at = seq(10, 40, 5))
abline(model, col = "blue", lwd = 2)

# -----------------------------
# Contingency table
# -----------------------------

# Remove NA values from both temperature and beer consumption
valid_entries <- complete.cases(Beer$Temperatura.Media..C., Beer$Consumo.de.cerveja..litros)

# Subset data to keep only valid (non-NA) rows
valid_data <- Beer[valid_entries, ]

# Create temp_bins and beer_bins after removing NAs
temp_bins <- cut(valid_data$Temperatura.Media..C.,
                 breaks = c(10, 15, 20, 25, 30, 35),
                 labels = c("10-15C", "16-20C", "21-25C", "26-30C", "31-35C"),
                 include.lowest = TRUE)

beer_bins <- cut(valid_data$Consumo.de.cerveja..litros,
                 breaks = c(10, 20, 25, 30, 35, 40),
                 labels = c("10-20L", "21-25L", "26-30L", "31-36L", "36-40L"),
                 include.lowest = TRUE)

cont_table <- table(temp_bins, beer_bins)
print(cont_table, quote = FALSE)


# -----------------------------
# Histograms
# -----------------------------
par(mfrow = c(1, 2))

hist(x,
     main = "Temperature",
     xlab = "Temperature (°C)",
     col = "lightblue")

hist(y,
     main = "Beer Consumption",
     xlab = "Liters",
     col = "lightgreen")

par(mfrow = c(1, 1))

# -----------------------------
# Beer consumption frequency + normal curve
# -----------------------------
y <- y[is.finite(y)]

h <- hist(y,
          main = "Beer consumption Frequency",
          xlab = "Beer consumption in liters",
          ylab = "Frequency",
          col = "azure",
          xlim = c(15, 40),
          ylim = c(0, 70))

m <- mean(y)
sd <- sd(y)

x_norm <- seq(min(y), max(y), length.out = 100)
y_norm <- dnorm(x_norm, mean = m, sd = sd)
y_norm <- y_norm * diff(h$mids[1:2]) * length(y)

lines(x_norm, y_norm, col = "red", lwd = 2)
