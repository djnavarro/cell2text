# packages
library(readxl)
library(purrr)
library(readr)
library(brio)
library(here)

# import the spreadsheet as a tibble
sheet <- read_xlsx(
  path = "spreadsheet.xlsx", # path to file
  col_names = FALSE          # don't treat first row as names
)

# convert to character vector and remove names
text <- unname(unlist(sheet))
text <- text[!is.na(text)]

# file naming function
name_file <- function(index) { 
  here(paste0("textfile_", index, ".txt"))
}

# iterate over vector of cell contents, writing each to a file
iwalk(text, ~write_file(.x, name_file(.y)))
