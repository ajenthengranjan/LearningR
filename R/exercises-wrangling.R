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
    select(bmi) %>%
    contains("age")
