# This is my first R program
print("Hello World!")

subject   <- "data driven security"
language  <- "R"
print(paste("This is a hands on project written in",
            language,
            "for ",
            subject,
            "subject",
            sep = " "))


library("ggplot2")
# now we can use functions exported by this package
url <- "https://raw.githubusercontent.com/offensive-security/exploitdb/master/files_exploits.csv"
url2 <- "https://raw.githubusercontent.com/offensive-security/exploit-database/master/files.csv"
exploitdb <-url
download.file(exploitdb, destfile = "db")
db <- read.csv("./db", header = T)
db_aggr <- dplyr::count(db, platform, sort = T)
ggplot(db_aggr, aes(x="", y=n, fill=platform))+ geom_bar(width = 1, stat = "identity")

db_aggr <- dplyr::count(db, platform, sort = T)
ggplot(head(db_aggr), aes(x=platform, y=n, fill=platform)) + geom_bar(stat = "identity")

if (!require("swirl")) {
  install.packages("swirl", repos="http://cran.rstudio.com/", quiet = T)
}
library("swirl")
swirl()
