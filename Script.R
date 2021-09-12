#------------------------------------------------------------------------------- Collect weather data

library(openweatherr)

apikey <- "222e546c9302a140b65a4aa0ab9566a2"

date <- list("2021-09-08", "2021-09-07","2021-09-06")

lat <- 53.480759
lon <- -2.242631

test <- get.weather(apikey,lat,lon,date)

#------------------------------------------------------------------------------- Build SQL Lite Pipeline

library(RSQLite)

# Create our SQLite database
conn <- dbConnect(RSQLite::SQLite(), "Weather_DB.db")

dbExecute(conn, "CREATE TABLE Weather_Data(
                  date TEXT,
                  hour NUMERIC,
                  temp NUMERIC,
                  main TEXT,
                  description TEXT,
                  wind_speed NUMERIC
                  )")


dbWriteTable(conn, "Weather_Data", test, append = T)



