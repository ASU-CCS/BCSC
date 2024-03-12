
# ----
# Load the needed libraries
library( here )
library( dplyr )
library( openxlsx )

# ----
# Load the data file with the ids we have
dat <- read.xlsx( 
  here( "BCSC-data-raw/safer-communities-dataset.xlsx" ),
  sheet = "Data"
)



# ----
# Load the data file for the community report
dat2 <- read.csv( 
  here( "BCSC-data-raw/BCSC-data-raw-monthly-reports/October-Community-Reentry-Report.csv" ),
  header = TRUE,
  as.is = TRUE
  )

table( dat$ADC %in% dat2$ADC )


# Build the data file
dat3 <- merge( dat, dat2, by.x = "ADC", by.y = "ADC", all.x = TRUE )
