# Vancouver-Housing-List-Prices-Web-Scrape
This is a project I created that uses the rvest package in R to scrape REMAX websites for data on list prices for housing and pulls variables on price, zip code, address, agent, square feet. This is achieved by using a for loop to resubmit over 150 unique URL's and gathered 1,360 observations across 7 variables. Additional data wrangling and tidying was achieved and new variables were created such as zone where a nested if_else function was used to evaluate the beginning three characters in the zip to assign it its unique geographical location based on neighborhood/area. My goals for this project were to provide context into the ever-increasing complexity and unknowns around Vancouver's growing housing market.
