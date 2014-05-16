#!/bin/bash

#######################################################
# R setup
#######################################################
echo "R SETUP"
# install MonetDB.R connector
sudo R -e "install.packages('MonetDB.R',repos='http://cran.rstudio.com/')"
#R -e "install.packages('dplyr',repos='http://cran.rstudio.com/')"

# add R startup file to automatically connect to MonetDB
echo 'local({
	library(MonetDB.R)
	cat("\nWelcome to MonetDB.R!\n")
	mdbfile <- readLines(file.path("~",".monetdb"))
	usr <- sub("user=","",grep("^user=",mdbfile,value=T),fixed=T)[[1]]
	pw <- sub("password=","",grep("^password=",mdbfile,value=T),fixed=T)[[1]]
	monetdbcredentials <<- list(user=usr,password=pw)
	monetdbconn <<- dbConnect(MonetDB.R(),"monetdb://localhost/db",user=usr,password=pw)
	cat("MonetDB connection available in monetdbconn, credentials in monetdbcredentials\n")
	cat("\nExample: dbGetQuery(monetdbconn,\"SELECT 1\")\n")
})' > ~/Rprofile.site
sudo mv ~/Rprofile.site /usr/lib64/R/etc/
