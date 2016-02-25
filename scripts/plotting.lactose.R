library('ProjectTemplate')
load.project()

head(clean.data, 10)
str(clean.data)

data.1 <- clean.data[, c(-1,-4)]
colnames(data.1)[1] <- "Milk"

data.1a <- data.1 %>% gather(HPLC.A, LACT01, c(3:6))

data.1a <- data.1a[,c(2,4)]
colnames(data.1a)[1] <- "HPLC"


data.2 <- clean.data[, c(-1,-3)]
colnames(data.2)[1] <- "Milk"

data.2a <- data.2 %>% gather(HPLC.B, LACT01, c(3:6))

data.2a <- data.2a[,c(2,4)]
colnames(data.2a)[1] <- "HPLC"

data.combined <- rbind(data.1a, data.2a)

lact.plot <- ggplot(data.combined, aes(x=HPLC, y=LACT01)) +
    geom_point(size = 4,shape = 21, fill = "cornflowerblue", col = "black") +
    geom_abline(slope =  1, intercept = 0, lty=2, colour = "red") +
    labs(title = "LACT01 to SUGA03 Comparison\n", x = "HPLC Result, g/100mL", y = "LACT01 Result, g/100mL") +
    theme_bw() +
    theme(plot.title = element_text(size = 18))
lact.plot
ggsave("graphs/Lactose Comparison.png")
