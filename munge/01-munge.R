
data.in <- read_excel("raw-data/Lactose_Trial.xlsx", sheet = 1)
colnames(data.in) <- make.names(colnames(data.in), unique = TRUE)

data.in <- data.in %>%
    mutate(HPLC.A = HPLC.A*Density, HPLC.B = HPLC.B*Density)

data.in <- data.in[,c(1,3:8)]

write.csv(data.in, "data/clean.data.csv", row.names = TRUE)
