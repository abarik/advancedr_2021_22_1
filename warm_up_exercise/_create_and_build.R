# Create this solution book ----

## Installing ----
install.packages("tint")
update.packages(ask = FALSE)


## Creating ----
## File / New file / RMarkdown... / From template / Tint is not Tufte (HTML)


## Building ----
rmarkdown::render(input = "solution.Rmd", output_format = "tint::tintHtml")
rmarkdown::render(input = "solution.Rmd", output_format = "tint::tintPdf")


