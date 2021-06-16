# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

summary(NHANES,bmi)

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
    Poverty)

nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm=TRUE),
              mean_age = mean(age, na.rm=TRUE),
              max_height = max(height, na.rm=TRUE),
              min_height = min(height, na.rm=TRUE),
              Med_pa = median(phys_active_days, na.rm=TRUE),
              median_age= median(age, na.rm=TRUE))

#calculating summary statistics by group

    nhanes_small %>%
        filter(!is.na(diabetes)) %>%
        group_by(diabetes) %>%
        summarise(mean_age = mean(age, na.rm=TRUE),
                 mean_bmi = mean(bmi, na.rm=TRUE)) %>%
        ungroup()

#saving data as files
#Saving data as an .rda file in the data
usethis::use_data(nhanes_small, overwrite =TRUE)
