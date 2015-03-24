setwd("~/Coursera/Assignment01")

# Create a function that calculates the mean PPM value for a specific
# pollutant across a range of *.csv files.  Read in the range of files
# specified by the arguement "id" and concatenate those files using "rbind".
# Return "Unknown particle" if the arguement "pollutant" is something other
# than nitrate or sulfate.

pollutantmean <- function(directory, pollutant, id=1:332) {
    files <- list.files(directory, full.names=TRUE)
    df <- data.frame()
    for (i in id) {
        df <- rbind(df, read.csv(files[i]))
    }
    if(pollutant=='sulfate') {
        mean(df$sulfate, na.rm=TRUE)
    } else if(pollutant=='nitrate') {
        mean(df$nitrate, na.rm=TRUE)
    } else {
        print("Unknow particle")
    }
}

pollutantmean("specdata", "sulfate", 1:10)

