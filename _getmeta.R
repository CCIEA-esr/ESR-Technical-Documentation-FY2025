# download/update the excel file with the spreadsheet ####

getMetadata <-function(erddap_id)
{

# get link from google drive

# 'https://docs.google.com/spreadsheets/d/1QlA_c8Km6SmkOke19nVpsE7gpw8RcY7zY69fnCeSIYo/edit?gid=727721099#gid=727721099'

# RUN THIS CHUNK BEFORE knitting TO DOWNLOAD THE MOST RECENT DATA

#library(googledrive)
#library(tidyverse)
library(dplyr)
#if(1==1){
#file_id = '1QlA_c8Km6SmkOke19nVpsE7gpw8RcY7zY69fnCeSIYo'
#drive_download( as_id(file_id) , path = 'metadata.csv', overwrite = TRUE)
#}

df = read.csv('metadata.csv')

df_trimmed<- df %>% select(c('Component_Section', 'Subcomponent', 'ERDDAP_Dataset_ID', 'Contact', 'Title', 'Institution', 'Source_Data', 'Additional_Calculations', 'region', 'latitude', 'longitude', 'latitude2', 'longitude2'))
meta <- df_trimmed %>% filter(ERDDAP_Dataset_ID==erddap_id)

return(meta)

}

