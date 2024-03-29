## ------------------------------------------------------------------------
subset(diamonds, cut == "Ideal")
my_subset <- diamonds[, c("carat", "cut", "color", "clarity")]


## ------------------------------------------------------------------------
diamonds$price_per_carat <- diamonds$price/diamonds$carat


## ------------------------------------------------------------------------
aggregate(price ~ cut, diamonds, mean)


## ------------------------------------------------------------------------
aggregate(price ~ cut + color, diamonds, mean)


## ------------------------------------------------------------------------
str(mtcars)


## ------------------------------------------------------------------------
library(tibble)
as_tibble(mtcars)


## ------------------------------------------------------------------------
library(dplyr)
diamonds %>% filter(cut == "Ideal")


## ------------------------------------------------------------------------
filter(diamonds, cut == "Ideal")


## ------------------------------------------------------------------------
mutate(diamonds, price_per_carat = price/carat)


## ------------------------------------------------------------------------
diamonds %>% mutate(price_per_carat = price/carat) %>% 
  filter(price_per_carat > 1500) 


## ------------------------------------------------------------------------
diamonds %>% summarise(mean = mean(price), std_dev = sd(price))


## ------------------------------------------------------------------------
diamonds %>% group_by(cut) %>% summarize(price = mean(price), carat = mean(carat))


## ----R challenge----------------------------------------------------------
parade_2005 <- read.table("../data/Parade2005.txt", header = TRUE)

parade_2005 %>% filter(state == "CA") %>% summarize(gemiddelde = mean(earnings))

parade_2005 %>% filter(state == "ID") %>% summarize(number = n())

parade_2005 %>% group_by(celebrity) %>% 
  summarize(mean = mean(earnings), median = median(earnings))

parade_2005 %>% filter(state == "ID") %>% 
  ggplot(aes(x = celebrity, y = earnings)) + theme_bw() +
  geom_boxplot(color = "blue")

## ------------------------------------------------------------------------
tab_1 <- data.frame(name = c("Alexis", "Bernie", "Charlie"),
                    children = 1:3,
                    stringsAsFactors = FALSE)
tab_2 <- data.frame(name = c("Alexis", "Bernie", "David"),
                    age = c(54, 34, 63),
                    stringsAsFactors = FALSE)
tab_1; tab_2


## ------------------------------------------------------------------------
inner_join(x = tab_1, y = tab_2, by = "name")


## ------------------------------------------------------------------------
left_join(x = tab_1, y = tab_2, by = "name")


## ------------------------------------------------------------------------
right_join(x = tab_1, y = tab_2, by = "name")


## ------------------------------------------------------------------------
full_join(x = tab_1, y = tab_2, by = "name")

