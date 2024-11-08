library(nbastatR)
library(dplyr)
library(xgboost)
library(caret)
library(hoopR)
library(gt)
library(ggplot2)
library(ggrepel)
library(png)
library(ggimage)
library(ggpath)
library(vip)
library(ggpmisc)
library(gtExtras)

Sys.setenv("VROOM_CONNECTION_SIZE" = 131072*10)

shots <- data.frame()

shots_21 <- teams_shots(all_active_teams = TRUE, season_types = "Regular Season", seasons = 2021)
shots_22 <- teams_shots(all_active_teams = TRUE, season_types = "Regular Season", seasons = 2022)
shots_23 <- teams_shots(all_active_teams = TRUE, season_types = "Regular Season", seasons = 2031)
shots_24 <- teams_shots(all_active_teams = TRUE, season_types = "Regular Season", seasons = 2024)

shots <- rbind(shots_21, shots_22, shots_23, shots_24)
unique(shots$typeAction)

shot_types <- c("Layup", "Dunk", "Jump", "Hook", "Pull", "Putback", "Tip", "Fadeaway", "Step Back", "Reverse", "Driving", "Floating", "Cutting", "Turnaround")

for (type in shot_types) {
   shots[[type]] <- grepl(type, shots$typeAction, ignore.case = TRUE)
}

unique(shots$zoneBasic)

shots <- shots%>%


  
