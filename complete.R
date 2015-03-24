setwd("~/Coursera/Assignment01")

# Create a function that calculates the number of completed entries files.
# First list all the file with the full path name.  Create an empty data frame
# and read in each file in the specified range.  Using a logical expression, 
# determine the length of the file where both sulfate and nitrate are not NA.
# Bind the file id and length to the empty data frame.  Change the column 
# names (future project to correct this without the use of "colnames()").

complete <- function(directory, id=1:332) {
    files <- list.files(directory, full.names=TRUE)
    output <- data.frame("id"=numeric(0), "nobs"=numeric(0))
    for (i in id) {
        df <- read.csv(files[i])
        nobs <- length(which(df$sulfate != "NA" & df$nitrate != "NA"))
        output <- rbind(output, c(i, nobs))
    }
    colnames(output) <- c("id", "nobs")
    print(output)
}

complete("specdata")
