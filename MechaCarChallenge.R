# Load tidyverse dplyr package
library(tidyverse)

## Deliverable 1 ##
# Import and read csv file as a dataframe
MechaCar <- read.csv(file='Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Generate multiple linear regression model to predict mpg
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)
   
# Generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar))

## Deliverable 2 ##
# Import and read csv file as a dataframe
Suspension_Coil <- read.csv(file="Resources/Suspension_Coil.csv",check.names=F,stringsAsFactors = F)

# Create a total summary dataframe of the suspension coil’s PSI column.
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups="keep")

# Create a lot summary dataframe grouped by manufacturing lot
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups="keep")

## Deliverable 3 ##
# T-test to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(Suspension_Coil$PSI, mu = 1500)

# T-tests to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
Lot1 <- subset(Suspension_Coil, Manufacturing_Lot == "Lot1")
Lot2 <- subset(Suspension_Coil, Manufacturing_Lot == "Lot2")
Lot3 <- subset(Suspension_Coil, Manufacturing_Lot == "Lot3")

# t-test for Lot1
t.test(Lot1$PSI, mu = 1500)
# t-test for Lot2
t.test(Lot2$PSI, mu = 1500)
# t-test for Lot3
t.test(Lot3$PSI, mu = 1500)