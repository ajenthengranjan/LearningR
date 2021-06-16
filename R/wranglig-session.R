#loading package
source(here::here("R/package-loading.R"))
#Briefly glimps content of the dataset
glimpse(NHANES)

select(NHANES,Age)

# Select multiple column
select(NHANES, Age, Weight, BMI)


#exclude columns
select(NHANES,-HeadCirc)

#select colums based on some criteria
select(NHANES, starts_with("BP"))

select(NHANES, ends_with("Day"))

select(NHANES, contains("Age"))
?select_helpers

#Make a smaller dataset
# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

# View the new data frame
nhanes_small



#Renaming columns

#to snakecase
nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)
colnames(nhanes_small)
colnames(NHANES)

#Renaming secific columns

nhanes_small <- rename(nhanes_small, sex=gender)

colnames(nhanes_small)
