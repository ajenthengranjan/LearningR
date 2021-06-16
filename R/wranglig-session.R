#loading package
source(here::here("R/package-loading.R"))
#Briefly glimps content of the dataset
glimpse(NHANES)

select(NHANES,Age)

# Select multiple column
select(NHANES, Age, Weight, BMI)


#exclude columns
select(NHANES,-HeadCirc)
