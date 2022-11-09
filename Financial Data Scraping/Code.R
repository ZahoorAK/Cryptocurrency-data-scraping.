#data on the prices, volumes and 24 hours prices change of top 50 cryptocurrencies taken from crypto.com

#pakeges required are dplyr and rvest

library("rvest")
library("dplyr")



link = "https://crypto.com/price"
page = read_html(link)
names = page %>% html_nodes(".css-rkws3") %>% html_text()
names
prices = page %>% html_nodes(".css-1vyy4qg .css-b1ilzc") %>% html_text()
prices
change = page %>% html_nodes(".css-1b7j986 .chakra-text") %>% html_text()
change


crypto = data.frame(names, prices, change, stringsAsFactors = FALSE)
View(crypto)

write.csv(crypto, "crypto.csv")

