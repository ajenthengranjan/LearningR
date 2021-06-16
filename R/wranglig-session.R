#loading package
source(here::here("R/package-loading.R"))
#Briefly glimps content of the dataset
glimpse(NHANES)

select(NHANES, Age)

# Select multiple column
select(NHANES, Age, Weight, BMI)


#exclude columns
select(NHANES,-HeadCirc)

#select colums based on some criteria
select(NHANES, starts_with("BP"))

select(NHANES, ends_with("Day"))

select(NHANES, contains("Age"))
? select_helpers

#Make a smaller dataset
# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(
    NHANES,
    Age,
    Gender,
    Height,
    Weight,
    BMI,
    Diabetes,
    DiabetesAge,
    PhysActiveDays,
    PhysActive,
    TotChol,
    BPSysAve,
    BPDiaAve,
    SmokeNow,
    Poverty
)

# View the new data frame
nhanes_small



#Renaming columns

#to snakecase
nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)
colnames(nhanes_small)
colnames(NHANES)

#Renaming secific columns

nhanes_small <- rename(nhanes_small, sex = gender)

colnames(nhanes_small)

#Using pipefunction to do multiple functions at once

nhanes_small %>% colnames()

#using several functions together

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

nhanes_small %>%
    rename(physically_active = phys_active)

#Filtering
#Filter for all female

nhanes_small %>%
    select(sex) %>%
    filter (sex == "female")

#Filter all not female

nhanes_small %>%
    select(sex) %>%
    filter(sex != "female")

#participants wjo have BMI equal to 25
nhanes_small %>%
    filter (bmi == 25)

#participants who have BMI equal to 25
nhanes_small %>%
    filter (bmi >= 25)

#participants who have BMI above 25 and female
nhanes_small %>%
    filter (bmi >= 25 & sex == "female")

#participants who have BMI above 25 OR female
nhanes_small %>%
    filter (bmi >= 25 | sex == "female")

#arranging data
# by age

nhanes_small %>%
    arrange(age)

# arrange by sex in asscending order
nhanes_small %>%
    arrange(sex)

# by age in descending order

nhanes_small %>%
    arrange(desc(age))

#Arranging by sex then age in ascending order
nhanes_small %>%
    arrange(desc(sex), age)

# Transform or add columns

nhanes_small %>%
    mutate(height = height / 100)

#add a column
nhanes_small <- nhanes_small %>%
    mutate(log_height = log(height))


nhanes_small %>%
    mutate(height = height/100, log_height=log(height))


# Add condition column
nhanes_small %>%
    mutate(highly_active =
               if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update <- nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update
