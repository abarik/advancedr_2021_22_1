# Tidyverse R

Hadley Wickham and Garrett Grolemund, in their excellent and freely available
book [R for Data Science](https://r4ds.had.co.nz/){target="_blank"}, promote the concept of “tidy data.” The Tidyverse collection of R packages attempt to realize this concept in concrete libraries. 

In brief, tidy data carefully separates variables (the columns of a table, also called
features or fields) from observations (the rows of a table, also called samples). At
the intersection of these two, we find values, one data item (datum) in each cell.
Unfortunately, the data we encounter is often not arranged in this useful way, and
it requires normalization. In particular, what are really values are often represented
either as columns or as rows instead. To demonstrate what this means, let us
consider an example.



```r
library(tidyverse)
#> -- Attaching packages ------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.4     v dplyr   1.0.7
#> v tidyr   1.1.4     v stringr 1.4.0
#> v readr   2.0.2     v forcats 0.5.1
#> -- Conflicts ---------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
# inline reading, tibble version
students <- tribble(
  ~'Last Name', ~'First Name', ~'4th Grade', ~'5th Grade', ~'6th Grade',
  "Johnson", "Mia", "A", "B+", "A2",
  "Lopez", "Liam", "B", "B", "A+",
  "Lee", "Isabella", "C", "C-", "B4",
  "Fisher", "Mason", "B", "B-", "C+",
  "Gupta", "Olivia", "B", "A+", "A",
  "Robinson", "Sophia", "A+", "B-", "A"
)
students
#> # A tibble: 6 x 5
#>   `Last Name` `First Name` `4th Grade` `5th Grade`
#>   <chr>       <chr>        <chr>       <chr>      
#> 1 Johnson     Mia          A           B+         
#> 2 Lopez       Liam         B           B          
#> 3 Lee         Isabella     C           C-         
#> 4 Fisher      Mason        B           B-         
#> 5 Gupta       Olivia       B           A+         
#> 6 Robinson    Sophia       A+          B-         
#> # ... with 1 more variable: 6th Grade <chr>
```






Returning to the small elementary school class we presented in the Preface, we
might encounter data looking like this:
students = pd.read_csv('data/students-scores.csv')
students

## The tibble

Tibbles inherits the attributes of a data frame and enhances some of them. The tibble is the central data structure for a set of packages known as the **tidyverse**.

Tibbles when printed out returns:

* the first 10 rows and
* all the columns that can fit on screen and
* column types.


