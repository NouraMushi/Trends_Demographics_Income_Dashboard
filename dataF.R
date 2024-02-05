library(tidyverse)

dataR <- read.table("data_file.data", sep=",")

colnames(dataR)<- c("age","workclass","fnlwgt","education","education_num","marital_status","occupation","relationship","race","sex","capital_gain"
                    ,"capital_loss","hours_per_week","native_country","prediction")


