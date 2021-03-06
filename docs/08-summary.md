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

## Modern graphics in R - ggplot2

### The grammar of graphics

The grammar of graphics lies at the heart of ggplot2 and also lies at the heart of how we define our data visualizations [@10.5555/1088896].

| Component  | Description                                 |
|------------|---------------------------------------------|
| Data       | Raw data that we'd like to visualize        |
| Geometries | Shapes that we use to visualize             |
| Aesthetics | Properties of geometries (size, color etc.) |
| Mapping    | Mapping between data and aesthetics         |

: (#tab:gog) The Grammar of Graphics


```r
library(tidyverse)
# a tibble for data, 3 rows, 4 columns
d.tbl <- tribble(
  ~group, ~score.1, ~score.2, ~score.3,
  "AA", 15, 42, 12, 
  "BB", 20, 28, 18,
  "CC", 35, 12, 21
)
```



```r
# Scatterplot
#   Data: d.tbl
#   Geometry: point
#   Aesthetics: x, y
#   Mapping: x=score.1, y=score.2
ggplot(data=d.tbl, mapping=aes(x=score.1, y=score.2)) + geom_point()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

```r
# Column Graph
#   Data: d.tbl
#   Geometry: column
#   Aesthetics: x, y
#   Mapping: x=score.1, y=score.2
ggplot(data=d.tbl, mapping=aes(x=score.1, y=score.2)) + geom_col()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-2.png" style="display: block; margin: auto;" />

```r
# Line Graph
#   Data: d.tbl
#   Geometry: line
#   Aesthetics: x, y
#   Mapping: x=score.1, y=score.2
ggplot(data=d.tbl, mapping=aes(x=score.1, y=score.2)) + geom_line()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-3.png" style="display: block; margin: auto;" />

```r
# all in one
ggplot(data=d.tbl, mapping=aes(x=score.1, y=score.2)) + 
  geom_point() + geom_col() + geom_line()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-4.png" style="display: block; margin: auto;" />

```r
# Scatterplot
#   Data: d.tbl
#   Geometry: point
#   Aesthetics: x, y, size, color
#   Mapping: x=score.1, y=score.2, size=score.3, color=group
ggplot(data=d.tbl, 
       mapping=aes(x=score.1, y=score.2, size=score.3, color=group)) + 
  geom_point()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-5.png" style="display: block; margin: auto;" />

```r
# Column Graph
#   Data: d.tbl
#   Geometry: column
#   Aesthetics: x, y, fill
#   Mapping: x=score.1, y=score.2, fill=score.3
ggplot(data=d.tbl, mapping=aes(x=score.1, y=score.2, fill=group)) + 
  geom_col()
```

<img src="08-summary_files/figure-epub3/unnamed-chunk-2-6.png" style="display: block; margin: auto;" />

### Geometries with required and optional aesthetics.

+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| Geometry           | Required aesthetics                              | Optional aesthetics                                                                     |
+====================+==================================================+=========================================================================================+
| `geom_abline()`    | `slope`, `intercept`                             | `alpha`, `color`, `linetype`, `size`                                                    |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_hline()`     | `yintercept`                                     | `alpha`, `color`, `linetype`, `size`                                                    |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_vline()`     | `xintercept`                                     | `alpha`, `color`, `linetype`, `size`                                                    |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_area()`      | `x`, `ymin`, `ymax`                              | `alpha`, `colour`, `fill`, `group`, `linetype`, `size`                                  |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_col()`       | `x`, `y`                                         | `alpha`, `colour`, `fill`, `group`, `linetype`, `size`                                  |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_bar()`       | `x`, `y`                                         | `alpha`, `colour`, `fill`, `group`, `linetype`, `size`                                  |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_boxplot()`   | `x`, `lower`, `middle`, `upper`, `ymax`, `ymin`) | `alpha`, `color`, `fill`, `group`, `linetype`, `shape`, `size`, `weight`                |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_density()`   | `x`, `y`                                         | `alpha`, `color`, `fill`, `group`, `linetype`, `size`, `weight`                         |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_dotplot()`   | `x`, `y`                                         | `alpha`, `color`, `fill`, `group`, `linetype`, `stroke`                                 |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_histogram()` | `x`                                              | `alpha`, `color`, `fill`, `linetype`, `size`, `weight`                                  |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_jitter()`    | `x`, `y`                                         | `alpha`, `color`, `fill`, `shape`, `size`                                               |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_line()`      | `x`, `y`                                         | `alpha`, `color`, `linetype`, `size`                                                    |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_point()`     | `x`, `y`                                         | `alpha`, `color`, `fill`, `shape`, `size`                                               |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_ribbon()`    | `x`, `ymax`, `ymin`                              | `alpha`, `color`, `fill`, `linetype`, `size`                                            |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_smooth()`    | `x`, `y`                                         | `alpha`, `color`, `fill`, `linetype`, `size`, `weight`                                  |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+
| `geom_text()`      | `label`, `x`, `y`                                | `alpha`, `angle`, `color`, `family`, `fontface`, `hjust`, `lineheight`, `size`, `vjust` |
+--------------------+--------------------------------------------------+-----------------------------------------------------------------------------------------+


### Plot types

<div class="figure" style="text-align: center">
<img src="08-summary_files/figure-epub3/gemabraklistaja-1.png" alt="Plot types and geometries"  />
<p class="caption">(\#fig:gemabraklistaja)Plot types and geometries</p>
</div>


### Themes

<img src="08-summary_files/figure-epub3/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

