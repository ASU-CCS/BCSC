
# Load the needed libraries
library( here )
library( dplyr )
library( openxlsx )

# Load the data file
dat <- read.xlsx( 
  here( "BCSC-data-raw/safer-communities-dataset.xlsx" ),
  sheet = "Data"
  )

# Look at the data in a spreadsheet
View( dat )


! waiting to set up the adcrr number

