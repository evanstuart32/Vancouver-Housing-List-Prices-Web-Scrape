# Vancouver-Housing-List-Prices-Web-Scrape
This is a project I created that uses the rvest package in R to scrape REMAX websites for data on list prices for housing and pulls variables on price, zip code, address, agent, square feet. This is achieved by using a for loop to resubmit over 150 unique URL's and gathered 1,360 observations across 7 variables. Additional data wrangling and tidying was achieved and new variables were created such as "zone" where a nested if_else function was used to evaluate the beginning three characters in the zip to assign it its unique geographical location based on neighborhood/area. My goals for this project were to gain some insight into Vancouver's housing market and to distinguish some key metrics for list prices.

I intend to build onto this project by adding variables such as house type, as this will provide more insight into the prices on specific property types. Furthermore I'd like to find more wesbites and data bases to bind into the existing dataframe.


"House_Listings_DF" contains the main data frame produced by scraping, wrangling, and creating the data

"Vancouver Housing Prices Listings" file contains all the R Studio code associated with the entire process and has some commentary explaining parts of the code.

"Rplot01" plots squarefeet and price and is fitted with a regression line.

"Zone V Median_list" plots the specific zones in Vancouver against the Median List price provided by the sample

"Kepler png" files show the Geospatial visualization -*Price per squarefoot*

![Screenshot](kepler-gl(1).png)
