# Create this book ----

## Installing ----
if (!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("rstudio/bookdown")

update.packages(ask = FALSE)

bookdown::create_bs4_book(".")

## Building ----
bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::pdf_book")
bookdown::render_book("index.Rmd", "bookdown::bs4_book")
bookdown::render_book("index.Rmd", "bookdown::epub_book")
