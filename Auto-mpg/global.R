library(tidyverse)
library(shiny)
library(glue)
library(DT)

cars <- read_csv('../data/auto-mpg.csv')

cars <- cars |> 
  mutate(horsepower = as.numeric(horsepower))
