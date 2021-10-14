# Summary

## RMarkdown

With R markdown, it is easy to reproduce not only the analysis used, but also the entire report. The advantage of using R markdown (versus a script) is that you can combine computation with explanation. In other words, you can weave the outputs of your R code, like figures and tables, with text to create a report.

|                 | RMarkdown                            | R script          |
|-----------------|--------------------------------------|-------------------|
| File extension  | .Rmd                                 | .R                |
| File contents   | R code + Markdown text + YAML header | R code            |
| Reproducibility | analysis + entire report             | only the analysis |
| Output format   | PDF, HTML, Word DOCX                 | \-                |

## Advanced data manipulation

+---------------------------+--------------------------------------------------------+------------------------------------------------+
|                           | Base R                                                 | Tidyverse R                                    |
+===========================+========================================================+================================================+
| Most used function        | `[]`                                                   | `%>%`                                          |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Import                    | `read.table()` `rio::import()`                         | `readr::read_delim()`                          |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-import)      | [Link](tidyverse-r.html#tr-import)             |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Export                    | `write.table()` `rio::export()`                        | `readr::write_delim()`                         |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-export)      | [Link](tidyverse-r.html#tr-export)             |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Inspecting dataset        | `str()`                                                | `dplyr::glimpse()`                             |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-inspect)     | [Link](tidyverse-r.html#tr-inspect)            |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Working with factors      | `factor()`                                             | `forcats::fct_infreq()`                        |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-factor)      | [Link](tidyverse-r.html#tr-factor)             |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Working with strings      | `paste()`                                              | `stringr::str_c()`                             |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-string)      | [Link](tidyverse-r.html#tr-string)             |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Working with column names | `names()`                                              | `dplyr::rename()`                              |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-col-names)   | [Link](tidyverse-r.html#tr-col-names)          |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Working with row names    | `rownames()`                                           | `tibble::rowid_to_column()`                    |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-row-names)   | [Link](tidyverse-r.html#tr-row-names)          |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Filtering columns         | `[]`                                                   | `dplyr::select()`                              |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-filter-cols) | [Link](tidyverse-r.html#tr-filter-cols)        |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Filtering rows            | `[]`                                                   | `dplyr::filter()`                              |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-filter-rows) | [Link](tidyverse-r.html#tr-filter-rows)        |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Sorting rows              | `[]`                                                   | `dplyr::arrange()`                             |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-sort)        | [Link](tidyverse-r.html#tr-sort)               |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Changing your data        | `cut()`                                                | `dplyr::mutate()`                              |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-changing)    | [Link](tidyverse-r.html#tr-changing)           |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Summarising data          | `aggregate()`                                          | `dplyr::summarise()`                           |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-summary)     | [Link](tidyverse-r.html#tr-summary)            |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Combining datasets        | `merge()`                                              | `dplyr::left_join()`                           |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-joins)       | [Link](tidyverse-r.html#tr-joins)              |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
| Reshaping data            | `reshape2::melt()` `reshape2::dcast()`                 | `tidyr::pivot_longer()` `tidyr::pivot_wider()` |
|                           |                                                        |                                                |
|                           | [Link](advanced-data-manipulation.html#br-reshape)     | [Link](tidyverse-r.html#tr-reshape)            |
+---------------------------+--------------------------------------------------------+------------------------------------------------+
