## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(schematic)

## -----------------------------------------------------------------------------
survey_data <- data.frame(
  id = c(1:3, NA, 5),
  name = c("Emmett", "Billy", "Sally", "Woolley", "Duchess"),
  age = c(19.2, 10, 22.5, 19, 19),
  sex = c("M", "M", "F", "M", NA),
  q_1 = c(TRUE, FALSE, FALSE, FALSE, TRUE),
  q_2 = c(FALSE, FALSE, TRUE, TRUE, TRUE),
  q_3 = c(TRUE, TRUE, TRUE, TRUE, FALSE)
)

## -----------------------------------------------------------------------------
my_schema <- schema(
  id ~ is_incrementing,
  id ~ is_all_distinct,
  c(name, sex) ~ is.character,
  c(id, age) ~ is_whole_number,
  education ~ is.factor,
  sex ~ function(x) all(x %in% c("M", "F")),
  starts_with("q_") ~ is.logical,
  final_score ~ is.numeric
)

## ----error=TRUE---------------------------------------------------------------
try({
check_schema(
  data = survey_data,
  schema = my_schema
)
})

## ----error=TRUE---------------------------------------------------------------
try({
my_helpful_schema <- schema(
  "values are increasing" = id ~ is_incrementing,
  "values are all distinct" = id ~ is_all_distinct,
  "is a string" = c(name, sex) ~ is.character,
  "is a whole number (no decimals)" = c(id, age) ~ is_whole_number,
  "has only entries 'F' or 'M'" = sex ~ function(x) all(x %in% c("M", "F")),
  "includes only TRUE or FALSE" = starts_with("q_") ~ is.logical,
  "is a number" = final_score ~ is.numeric
)

check_schema(
  data = survey_data,
  schema = my_helpful_schema
)
})

