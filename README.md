# Vancouver-Housing-List-Prices-Web-Scrape

![Screen Shot 2021-02-12 at 12 25 38 PM](https://user-images.githubusercontent.com/77028732/116931471-dd2df780-ac15-11eb-85ae-16ace51d50e2.png)

I created this sample as a project aimed to uncover some details and data on Vancouver's complex and changing residential housing market. Low-interest rates combined with the socioeconomic impacts of a new culture of work from home motivated me to collect a sample on house list prices. I plan to run my code and take a new sample every 6 months moving forward to help capture data and compare changes in my data frame's variables.

This project was created entirely in R by scraping REMAX websites to collect a sample data frame containing over 1,300 observations. I managed to pull variables on price, zip code, address, agent, square feet while also creating new variables such as price per square foot, area, and longitudinal and latitudinal coordinates. 

I managed to assign geographical coordinates by binding a CSV file with over 850,000 rows on Canadian postal codes containing  latitude and longitude, with my original data frame using postal code as the common variable. 

I then used Kepler.gl to create my spatial visualization of price per square foot in the Vancouver area to shed some light on Vancouver's constantly changing and complex housing market. 


"House_Listings_DF" contains the main data frame produced by scraping, wrangling, and consolidating the data

"Vancouver Housing Prices Listings" file contains all the R Studio code associated with the entire process and has some commentary explaining parts of the code.

"Rplot01" plots squarefeet and price and is fitted with a regression line.

"Zone V Median_list" plots the specific zones in Vancouver against the Median List price provided by the sample

"Kepler png" files show the Geospatial visualization -*Price per squarefoot*


