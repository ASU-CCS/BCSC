
# ----
# Load the needed libraries
library( here )     # for referencing the directory
library( dplyr )    # for working with the data objects
library( openxlsx ) # for reading excel files
library( readxl )   # for reading excel files
library( readr )    # for working with csv files


# ----
# Load the data file with the ids we have
datID <- read.xlsx( 
  here( "BCSC-data-raw/safer-communities-dataset.xlsx" ),
  sheet = "Data"
)

# create the master id to use for the files below
datID <- datID$ADC



###########

# ----
# Look through the community report documents
# and pull out those cases that are in the 
# main data set

# set the directory for where the files are located
directory <- here( "BCSC-data-raw/BCSC-data-raw-monthly-reports" )

# create a list of the files in the folder
file_list <- list.files( directory, pattern = ".xlsx$", full.names = TRUE )

# create a an empty list to populate
dat.list <- list()

# loop through the files to create the data files
for( i in 1: length( file_list ) ){
  
  # read in the data file
  dat.list[[i]] <- read.xlsx( file_list[i] )

  # change the id name to match across files
  dat.list[[i]]
  
  # select those cases that match the main data file
  dat.list[[i]] <- dat.list[[i]] %>% 
    filter( dat.list[[i]]$"ADC.#" %in% datID  == "TRUE" )
  
}


!!!!HERE: trying to get it to rename the variable id across the cases


dat.list[[2]] <- read.xlsx( file_list[2] )

colnames( dat.list[[2]][,4] ) <- "ADCid"


# select those cases that match the main data file
dat.list[[2]] <- dat.list[[2]] %>% 
  filter( dat.list[[2]]$"ADC.#" %in% datID  == "TRUE" )




