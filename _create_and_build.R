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


# Bulding lesson 1 ----
rmarkdown::render("_rmarkdown_example.Rmd", "html_document")
rmarkdown::render("_rmarkdown_example.Rmd", "pdf_document")
rmarkdown::render("_rmarkdown_example.Rmd", "word_document")

rmarkdown::render("_rmarkdown_example_2.Rmd", "word_document")

