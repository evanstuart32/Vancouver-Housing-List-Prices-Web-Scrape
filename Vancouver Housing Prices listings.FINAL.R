library(rvest)
library(dplyr)

library(stringr)
install.packages("qdap")
library(qdap)
###
#bedrooms '.bold.ng-star-inserted'

#squarefeet size  '.detail:nth-child(5) .bold'

#City    '.address .ng-star-inserted:nth-child(2) .ng-star-inserted'

#zip code   '.address .ng-star-inserted:nth-child(4) .ng-star-inserted'

#price   '.price'

#type [removed] '.classifier:nth-child(1)'  

#agency [removed] '.courtesy span'

#address      '.address .ng-star-inserted:nth-child(1) .ng-star-inserted'
###

url      'https://www.remax.ca/bc/vancouver-real-estate?page=1'

###Housing prices scraped from online remaxrealtor site


url6 <- 'https://www.remax.ca/bc/vancouver-real-estate?page=1'

house_prices2 <- data.frame()

for(page in seq(from = 1, to = 160, by= 1)) { 
  url6= paste0('https://www.remax.ca/bc/vancouver-real-estate?page=', page) 
  url7 <- read_html(url6)
  city <- url7 %>%html_nodes('.address .ng-star-inserted:nth-child(2) .ng-star-inserted') %>% html_text()
  bedrooms <- url7 %>% html_nodes('.bold.ng-star-inserted') %>% html_text()
  squarefeet <- url7 %>% html_nodes('.detail:nth-child(5) .bold') %>% html_text()
  zip <- url7 %>% html_nodes('.address .ng-star-inserted:nth-child(4) .ng-star-inserted') %>% html_text()
  price <- url7 %>% html_nodes('.price') %>% html_text()
  address <- url7 %>% html_nodes('.address .ng-star-inserted:nth-child(1) .ng-star-inserted') %>% html_text()
  agency <- url7 %>% html_nodes('.courtesy span') %>% html_text()
  
  
  
  house_prices2 <- rbind(house_prices2, data.frame(zip,address, city, agency, bedrooms, price, squarefeet, stringsAsFactors = FALSE))
  
  house_prices2$city <-str_remove(house_prices2$city, ',')
  
  house_prices2$price <-str_replace_all(house_prices2$price, fixed("$"), '')
  house_prices2$price <- as.numeric(str_replace_all(house_prices2$price, fixed(","), ''))
  house_prices2 <- house_prices2 %>% filter(!duplicated(address))
  
  
  house_prices2$price %>% max(na.rm = TRUE)
  
  print(paste(url7, page))
  }
  
  length(zip)
  length(price)
  length(type)
  length(city)
  length(bedrooms)
  length(squarefeet)
  length(agency)
  length(address)
  
  sum(is.na(house_prices2$squarefeet))
  #above confirms NA present are character imports scraped from the site
  
  
 typeof(house_prices2$squarefeet)
 
 
   house_prices2[house_prices2== "N/A"] <- NA
   house_prices2$squarefeet <- house_prices2$squarefeet %>% trimws(which = c("both"))
   house_prices2$squarefeet[house_prices2$squarefeet== "N/A"] <- NA 
  
  house_prices2$squarefeet <- as.numeric(house_prices2$squarefeet)
  
  
  
  

#creating new variables
  typeof(house_prices2$zip)
house_prices4 <- house_prices2 %>% 
  mutate(Price_per_sqft = price/squarefeet)

house_prices4 <- house_prices2 %>% mutate(zone = if_else(substr(house_prices2$zip, 1, 3) == "V5K", "North hastings-Sunrise", 
                if_else(substr(house_prices2$zip, 1, 3) =="V5L", "North Grandview", if_else(substr(house_prices2$zip, 1, 3) == "V5M", "South Hastings-Sunrise/North Renfrew",
                      if_else(substr(house_prices2$zip, 1, 3) == "V5N", "South Grandview", if_else(substr(house_prices2$zip, 1, 3) == "V5P",
                          "SE Kensington-Cedar Cottage/Victoria", if_else(substr(house_prices2$zip, 1, 3) == "V5R", "South Renfrew", if_else(substr(house_prices2$zip, 1, 3) =="V5S",
                                    "Killarney", if_else(substr(house_prices2$zip, 1, 3) == "V5T", "East Mount Pleasant", if_else(substr(house_prices2$zip, 1, 3) == "V5V",
                                            "West Kensington-Cedar Cottage/ NE Riley Park", if_else(substr(house_prices2$zip, 1, 3) == "V5W", "SE Riley Park",
                                                      if_else(substr(house_prices2$zip, 1, 3) =="V5X", "SE Oakridge/ East Marpole/ South Sunset", if_else(substr(house_prices2$zip, 1, 3) =="V5Y",
                                            "West Mount Pleasant/ West Riley Park", if_else(substr(house_prices2$zip, 1, 3) == "V5Z", "East Fairview/ South Cambie", 
                                      if_else(substr(house_prices2$zip, 1, 3) =="V6A", "Strathcona/Chinatown/ Downtown Eastside", if_else(substr(house_prices2$zip, 1, 3) == "V6B", "NE Downtown/ Gastown/ Yaletown", 
                              if_else(substr(house_prices2$zip, 1, 3) == "V6C", "Waterfront/Coal Harbour/ Canada Place", if_else(substr(house_prices2$zip, 1, 3) == "V6E", "SE West End/Davie Village",
                    if_else(substr(house_prices2$zip, 1, 3) == "V6G", "NW West End/ Stanley Park", if_else(substr(house_prices2$zip, 1, 3) =="V6H", "West fairview/ Granville Island/ NE Shaughnessy", 
                         if_else(substr(house_prices2$zip, 1, 3) == "V6J", "NW Shaughnessy/ East Kitsilano/ Quilchena", if_else(substr(house_prices2$zip, 1, 3) == "V6K", "Central Kitsilano",
                             if_else(substr(house_prices2$zip, 1, 3) =="V6L", "NW Arbutus Ridge/NE Dunbar", if_else(substr(house_prices2$zip, 1, 3) =="V6M", "South Shaughnessy/ NE Kerrisdale/ NW Oakridge",
                                  if_else(substr(house_prices2$zip, 1, 3) =="V6N", "West Kerrisdale/ South Dunbar", if_else(substr(house_prices2$zip, 1, 3) == "V6P", "SE Kerrisdale/West Marpole",
                                        if_else(substr(house_prices2$zip, 1, 3) =="V6R", "West Kitsilano/ West Point Grey/Jericho", if_else(substr(house_prices2$zip, 1, 3) =="V6S", "NW Dunbar", 
                                              if_else(substr(house_prices2$zip, 1, 3) == "V6T", "UBC Endowment Lands", if_else(substr(house_prices2$zip, 1, 3) =="V6Z", "SW Downtown", 
                                                    if_else(substr(house_prices2$zip, 1, 3) == "V7X", "Bentall Centre", if_else(substr(house_prices2$zip, 1, 3) =="V7Y", "Pacific Centre", "Not Available")))))))))) ))))))))))))))))))))))

### Upper two variables created with mutate function condensed into one function below
  
  
house_prices4 <- house_prices2 %>% 
  mutate(Price_per_sqft = price/squarefeet, zone = if_else(substr(house_prices2$zip, 1, 3) == "V5K", "North hastings-Sunrise", 
                                                            if_else(substr(house_prices2$zip, 1, 3) =="V5L", "North Grandview", if_else(substr(house_prices2$zip, 1, 3) == "V5M", "South Hastings-Sunrise/North Renfrew",
                                                                                                                                        if_else(substr(house_prices2$zip, 1, 3) == "V5N", "South Grandview", if_else(substr(house_prices2$zip, 1, 3) == "V5P",
                                                                                                                                                                                                                     "SE Kensington-Cedar Cottage/Victoria", if_else(substr(house_prices2$zip, 1, 3) == "V5R", "South Renfrew", if_else(substr(house_prices2$zip, 1, 3) =="V5S",
                                                                                                                                                                                                                                                                                                                                        "Killarney", if_else(substr(house_prices2$zip, 1, 3) == "V5T", "East Mount Pleasant", if_else(substr(house_prices2$zip, 1, 3) == "V5V",
                                                                                                                                                                                                                                                                                                                                                                                                                                      "West Kensington-Cedar Cottage/ NE Riley Park", if_else(substr(house_prices2$zip, 1, 3) == "V5W", "SE Riley Park",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if_else(substr(house_prices2$zip, 1, 3) =="V5X", "SE Oakridge/ East Marpole/ South Sunset", if_else(substr(house_prices2$zip, 1, 3) =="V5Y",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "West Mount Pleasant/ West Riley Park", if_else(substr(house_prices2$zip, 1, 3) == "V5Z", "East Fairview/ South Cambie", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if_else(substr(house_prices2$zip, 1, 3) =="V6A", "Strathcona/Chinatown/ Downtown Eastside", if_else(substr(house_prices2$zip, 1, 3) == "V6B", "NE Downtown/ Gastown/ Yaletown", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      if_else(substr(house_prices2$zip, 1, 3) == "V6C", "Waterfront/Coal Harbour/ Canada Place", if_else(substr(house_prices2$zip, 1, 3) == "V6E", "SE West End/Davie Village",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         if_else(substr(house_prices2$zip, 1, 3) == "V6G", "NW West End/ Stanley Park", if_else(substr(house_prices2$zip, 1, 3) =="V6H", "West fairview/ Granville Island/ NE Shaughnessy", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if_else(substr(house_prices2$zip, 1, 3) == "V6J", "NW Shaughnessy/ East Kitsilano/ Quilchena", if_else(substr(house_prices2$zip, 1, 3) == "V6K", "Central Kitsilano",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if_else(substr(house_prices2$zip, 1, 3) =="V6L", "NW Arbutus Ridge/NE Dunbar", if_else(substr(house_prices2$zip, 1, 3) =="V6M", "South Shaughnessy/ NE Kerrisdale/ NW Oakridge",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if_else(substr(house_prices2$zip, 1, 3) =="V6N", "West Kerrisdale/ South Dunbar", if_else(substr(house_prices2$zip, 1, 3) == "V6P", "SE Kerrisdale/West Marpole",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if_else(substr(house_prices2$zip, 1, 3) =="V6R", "West Kitsilano/ West Point Grey/Jericho", if_else(substr(house_prices2$zip, 1, 3) =="V6S", "NW Dunbar", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if_else(substr(house_prices2$zip, 1, 3) == "V6T", "UBC Endowment Lands", if_else(substr(house_prices2$zip, 1, 3) =="V6Z", "SW Downtown", 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             if_else(substr(house_prices2$zip, 1, 3) == "V7X", "Bentall Centre", if_else(substr(house_prices2$zip, 1, 3) =="V7Y", "Pacific Centre", "Not Available")))))))))) ))))))))))))))))))))))
  



house_prices4$address <- str_replace_all(house_prices4$address, fixed(','), '')

### below tests that city variable has included spaces of unknown placement that affect logical operations and comparisons
listings_by_van_zone <- house_prices4 %>% group_by(city, zone) %>%
  filter(city == "Vancouver") 

house_pricestest <- house_prices4$city%>% trimws(which = c("both"))

sum(house_pricestest == "Vancouver")


house_prices4$city <- house_prices4$city %>% trimws(which = c("both"))


### Median house listing prices and average price per squarefoot by city

listings_by_city <- house_prices4 %>% group_by(city) %>% 
  summarise(median_list_price = median(price, na.rm = TRUE),average_price_per_sqfoot= sum(Price_per_sqft, na.rm = TRUE)/n() ,frequency = n())

listings_by_van_zone <- house_prices4 %>% group_by(zone) %>%
  filter(city == "Vancouver", !zone == "Not Available") %>% 
  summarise(median_list = median(price), median_Price_sqfoot = median(Price_per_sqft, na.rm = TRUE), frequency = n()) %>% 
  arrange(desc(median_list))
  







