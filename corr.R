setwd("~/Coursera/Assignment01")

# Create a function that determines the correlation between sulfate and nitrate
# for each file.  First create a list of all files and determine the number of files
# present.  Create an empty numeric vector "cr".  Loop through all files 1 through
# "num".  Figure out if the number of complete entries in a file exceeds the
# the threshold.  If yes, then calculate the correlation.  Print out the vector "cr"
# results (head(), summary() and length()).

corr <- function(directory, threshold=0) {
    files <- list.files(directory, full.names=TRUE)
    num <- length(files)
    result <- vector(mode="numeric", length=0)
    for (i in 1:num) {
        df <- read.csv(files[i])
        count <- length(which(df$sulfate != "NA" & df$nitrate != "NA"))
        if(count > threshold) {
            result <- append(result, cor(df$sulfate, df$nitrate, use="pairwise.complete.obs"))
        }
    }
    return(result)
}

