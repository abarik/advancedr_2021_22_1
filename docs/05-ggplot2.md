# Modern graphics 

## Overview

ggplot2 was created by Hadley Wickham back in 2005 as an implementation of Leland Wilkinson’s grammar of graphics.
The general idea behind the grammar of graphics is that a plot can be broken down into different elements and assembled by adding elements together. This reasoning is the foundation of the popular data visualization package ggplot2. 

ggplot2 is built on the premise that graphically data can be represented as either:

* Points e.g. in the case of scatter plots
* Lines e.g. in the case of line plots
* Bars e.g. in the case of histograms and bar plots
* Or a combination of some or all of them e.g. dot plot

These are collectively known as geometric objects. These geometric objects can have different attributes (colours, shape, and size). These attributes can either be mapped or set during plotting.

Mapping simply means colour, shape and size are added in such a manner that they are linked to the underlying data represented by the geometric objects. In so doing they add more information and understanding to the plot and most often changes if the underlying data changes.

While setting, on the other hand, is not linked to the underlying data but rather adds more beauty than information. Because they add little or no information, setting should be done with care most especially when using size and shape.

ggplot2 consist of seven layers which are:

* data: holds data to be plotted
* geom: determines the type of plot, that is the type of geometric object to be used e.g. geom_point(), geom_line(), geom_bar(), etc.
* aesthetics: maps data and attributes (colour, shape, and size) to the geom
* stat: performs a statistical transformation
* position adjustment: determines where elements are positioned on the plot relative to others
* coordinate-system: manipulates the coordinate system
* faceting: used for creating subplots


```r
library(ggplot2)
library(dplyr)
library(gapminder)
data(gapminder)

# data preparation
gapminder_2007 <- gapminder %>%
  filter(year == '2007' & continent != 'Oceania') %>%
  select(-3) %>%
  mutate(pop = round(pop/1e6, 2))

head(gapminder_2007)
#> # A tibble: 6 x 5
#>   country     continent lifeExp   pop gdpPercap
#>   <fct>       <fct>       <dbl> <dbl>     <dbl>
#> 1 Afghanistan Asia         43.8  31.9      975.
#> 2 Albania     Europe       76.4   3.6     5937.
#> 3 Algeria     Africa       72.3  33.3     6223.
#> 4 Angola      Africa       42.7  12.4     4797.
#> 5 Argentina   Americas     75.3  40.3    12779.
#> 6 Austria     Europe       79.8   8.2    36126.
```


## The data layer

The function `ggplot()` initializes a ggplot object. It can be used to pass in both data and aesthetic. Data and aesthetic passed in here becomes available to all subsequent layers but can be overridden if need be within subsequent layers.


```r
# initializing plot with data
ggplot(data = gapminder_2007)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

```r
# mapping data to x and y-axis
ggplot(data = gapminder_2007,  mapping = aes(y = lifeExp, x = gdpPercap))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-2-2.png)<!-- -->


##  The geom layer

The geom layer declares the type of plot to be produced. More on this in the next chapter.


```r
# adding the geom layer
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->

```r

# Both data and axis can be declared within the geom layer.
ggplot(data = gapminder_2007) + 
  geom_point(mapping = aes(y = lifeExp, x = gdpPercap))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-3-2.png)<!-- -->

```r

ggplot() + 
  geom_point(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-3-3.png)<!-- -->


##  Shape

Shapes are controlled using the argument shape.

### Setting shapes

Shapes are set by passing shape to geom_* but must be placed outside aes() as aes() is meant for mapping. Shape expects the same arguments as pch in base graphics that is, integers ranging from 1 to 25 or characters.


```r
# changing shapes
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), shape = 21)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->

```r
# using a character
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), shape = '*')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-4-2.png)<!-- -->


### Mapping shapes

The mapping of data to shapes allows us to have shapes by groups or categories for example having different shapes for different continents. To map data to shapes, the shape argument is passed a categorical variable and placed within `aes()`.



```r
# shapes by continent
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, shape = continent))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->


### Scaling shapes

The function `scale_shape_manual()` is used to scale shapes that is determine the shapes to use in the plot.


```r
# using shapes ranging from 15 to 19
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, shape = continent)) +
  scale_shape_manual(values = 15:19)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-6-1.png)<!-- -->


##  Size

size is controlled using the argument `size=`.

###  Setting size


```r
# adjusting size
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), size = 3)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-7-1.png)<!-- -->


### Mapping size

Size is mapped by assigning them a continuous variable and placing them within `aes()`.


```r
# size by population
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop), shape = 21)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-8-1.png)<!-- -->


##  Colour

Colour is controlled using the argument `color=` or `colour=`.

### Setting colours


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), colour = 'darkblue', size = 3, shape = 19)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->

### Fill vs colour

With shapes between 21 to 25 and bars, the argument fill is used to fill shapes while colour is used to colour borders (outlines).


```r
# using colour and fill
ggplot(gapminder_2007) + 
geom_point(aes(y = lifeExp, x = gdpPercap), colour = 'darkblue', fill = 'lightblue', 
           size = 3, shape = 21)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->

### Stroke

The border or outline size is controlled using the argument `stroke=`.


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), colour = 'darkblue', fill = 'lightblue', 
           size = 3, shape = 21, stroke = 1)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-11-1.png)<!-- -->

### Transparency

Transparency is controlled by the argument `alpha=`. It accepts values from 0 to 1.


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap), 
           colour = 'darkblue', fill = 'lightblue', size = 3, shape = 21, 
           stroke = 1, alpha = 0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-12-1.png)<!-- -->


### Mapping colours to discrete variables

As with shapes, colours are mapped by assigning a discrete variable to them and placing them within `aes()`.


```r
# colour by continent
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-13-1.png)<!-- -->

```r
# fill by continent
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, fill = continent), 
             colour = 'darkblue', size = 4, shape = 21, alpha = 0.5, stroke = 1)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-13-2.png)<!-- -->


### Default colours

The functions `scale_colour_hue()` and `scale_fill_hue()` sets the default colour and fill scale for discrete variables.


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5) +
  scale_colour_hue()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-14-1.png)<!-- -->


```r
# Adjust luminosity and chroma
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5) +
  scale_colour_hue(l = 70, c = 150)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-15-1.png)<!-- -->

```r


# Changing the range of hues used
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5) +
  scale_colour_hue(h = c(0, 90))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-15-2.png)<!-- -->


### Grey colours

The function `scale_colour_grey()` defines grey colours for discrete variables.


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5) +
  scale_colour_grey()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-16-1.png)<!-- -->

### Manually specifying colours

The functions `scale_colour_manual()` and `scale_fill_manual()` specify colour and fill, respectively.


```r
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.5) +
  scale_colour_manual(values = c('lightblue', 'lightgreen', 'purple', 'orange', 'pink'))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-17-1.png)<!-- -->

### Mapping colours by continuous variables

As with sizes, colours are mapped by assigning a continuous variable to them and placing them within `aes()`.


```r
# colour by pop
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = pop), shape = 19) +
  scale_radius(range = c(1, 24))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-18-1.png)<!-- -->

```r
# reversing colour with desc()
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, colour = desc(pop)), shape = 19) +
  scale_radius(range = c(1, 24))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-18-2.png)<!-- -->


### Manually defining colours

The functions:

scale_colour_gradient() and scale_fill_gradient() defines a two-colour gradient
scale_colour_gradient2() and scale_fill_gradient2() defines a three-colour gradient (low-mid-high)
scale_colour_gradientn() and scale_fill_gradientn() defines a more then three colour gradient


```r
# two colour gradient
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = desc(log(pop))), 
           shape = 19, alpha = 0.8) +
  scale_radius(range = c(1, 24)) +
  scale_colour_gradient(low = 'lightgreen', high = 'darkgreen')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-19-1.png)<!-- -->

```r
# three colour gradient
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = pop), 
           shape = 19, alpha = 0.8) +
  scale_radius(range = c(1, 24)) +
  scale_colour_gradient2(low = 'blue', mid = 'red', high = 'green', 
                         midpoint = mean(gapminder_2007$pop))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-19-2.png)<!-- -->

```r
# five colour gradient
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = pop), shape = 19) +
  scale_radius(range = c(1, 24)) +
  scale_colour_gradientn(colors = c('lightblue', 'lightgreen', 'purple', 'orange', 'pink'))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-19-3.png)<!-- -->


## Colour palettes

### rcolorbrewer

RcolorBrewer is R’s implementation of ColorBrewer. It classifies colours into three board classes:

seq (sequential): suited for data which has an order, progressing from low to high
div (diverging): suited for data with two extremes, one for positive and the other for negative values
qual (qualitative): suited for data which colour bears no meaning. (nominal and categorical data)


```r
library(RColorBrewer)
# displays all the various palettes in RcolorBrewer
display.brewer.all()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-20-1.png)<!-- -->

```r


# display sequential colours
display.brewer.all(type = "seq")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-20-2.png)<!-- -->

```r


# display diverging colours
display.brewer.all(type = "div")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-20-3.png)<!-- -->

```r


# display qualitative colours
display.brewer.all(type = "qual")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-20-4.png)<!-- -->

```r


# displaying a particular colour palette
display.brewer.pal(n = 8, name = 'Dark2')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-20-5.png)<!-- -->


The functions `scale_colour_brewer()` and `scale_fill_brewer()` defines colour scale for discrete variables.


```r
# discrete variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, shape = 19, 
             alpha = 0.5) +
  scale_colour_brewer(palette = "Dark2")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-21-1.png)<!-- -->


The argument direction reverses the order of the colours.


```r
# reversing colours with direction
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, shape = 19, 
             alpha = 0.5) +
  scale_colour_brewer(palette = "Dark2", direction = -1)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-22-1.png)<!-- -->

The type of palette is specified by the argument type.


```r
# specifying palette class
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, shape = 19, 
             alpha = 0.5) +
  scale_colour_brewer(type = 'qual', palette = 1)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-23-1.png)<!-- -->

```r
# specifying palette class
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, shape = 19, 
             alpha = 0.5) +
  scale_colour_brewer(type = 'seq', palette = 3)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-23-2.png)<!-- -->


The functions `scale_colour_distiller()` and `scale_fill_distiller()` defines colour scale for continuous variables.


```r
# continuous variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = log(pop)), shape = 19) +
  scale_radius(range = c(1, 24)) +
  scale_colour_distiller(palette = 'Blues')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-24-1.png)<!-- -->

```r
# continuous variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = log(pop)), shape = 19) +
  scale_radius(range = c(1, 24)) +
  scale_colour_distiller(palette = 1, direction = 1)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-24-2.png)<!-- -->


### The viridis color palettes

The viridis package brings to R colour scales created by Stéfan van der Walt and Nathaniel Smith for the Python data visualization package matplotlib. viridis comes with the following colour palettes:

* Viridis (default)
* magma
* plasma
* inferno

The functions `scale_colour_viridis()` and `scale_fill_viridis()` defines colour scale for both discrete and continuous variables, with `discrete = TRUE` indicating discrete while `discrete = FALSE` indicating continuous. To be more specific, use `scale_colour_viridis_d()` for discrete and` scale_colour_viridis_c()` for continuous.


```r
library(viridis)
# discrete variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
           shape = 19, alpha = 0.8) +
  scale_colour_viridis(discrete = TRUE)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-25-1.png)<!-- -->

```r
# discrete variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, colour = continent), size = 3, 
             shape = 19, alpha = 0.8) +
  scale_colour_viridis_d(option = 'plasma')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-25-2.png)<!-- -->

```r

# continuous variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = log(pop)), shape = 19) +
  scale_radius(range = c(1, 24)) +
  scale_colour_viridis()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-25-3.png)<!-- -->

```r
# continuous variable
ggplot(gapminder_2007) + 
  geom_point(aes(y = lifeExp, x = gdpPercap, size = pop, col = log(pop)), shape = 19) +
  scale_radius(range = c(1, 24)) +
  scale_colour_viridis_c(option = 'inferno', direction = -1, alpha = 0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-25-4.png)<!-- -->


## Text

The function `geom_text()` adds text to a plot.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  geom_text(aes(label = country), size = 2, alpha = 0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-26-1.png)<!-- -->


## Fitting a regression line to a plot

The function `geom_smooth()` adds a regression line to a plot. We use the arguments:

method = lm for linear,
method = loess for loess and
se = FALSE to remove the confidence intervals.


```r
# adding a linear line
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(colour = 'red', size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  geom_smooth(method = lm)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-27-1.png)<!-- -->

```r
# changing to loess
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(colour = 'red', size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  geom_smooth(method = loess)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-27-2.png)<!-- -->

```r
# removing the confidence intervals
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(colour = 'red', size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  geom_smooth(method = loess, se = FALSE)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-27-3.png)<!-- -->


## Adding some rug

The function `geom_rug()` adds rug to a plot.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(colour = 'red', size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  geom_smooth(method = loess, se = FALSE) +
  geom_rug()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-28-1.png)<!-- -->


## Position adjustment

Position adjustments determine how to arrange geoms that would otherwise occupy the same space.


```r
ggplot() + 
  geom_point(data = gapminder_2007, aes(y = 0, x = gdpPercap, colour = continent), 
             alpha = 0.5, size = 3)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-29-1.png)<!-- -->

```r
# changing the position to jitter
ggplot() + 
  geom_point(data = gapminder_2007, aes(y = 0, x = gdpPercap, colour = continent), 
             alpha = 0.5, size = 3, position = "jitter")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-29-2.png)<!-- -->


## Coordinate system

The function `coord_cartesian()` zooms a plot. It expects ylim and/or xlim arguments.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  geom_text(aes(label = country), size = 2, alpha = 0.5) +
  coord_cartesian(ylim = c(60, 85), xlim = c(0, 10000))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-30-1.png)<!-- -->


The function `coord_fixed()` controls the aspect ratio. It expects a ratio of y/x.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  coord_fixed(ratio = 500)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-31-1.png)<!-- -->


The function `coord_flip()` flips a plot along its diagonal.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  coord_flip()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-32-1.png)<!-- -->


## Faceting layer

The functions `facet_grid()` and `facet_wrap()` controls faceting. The former forms a matrix of panels defined by row and column faceting variables while the later wraps a 1d sequence of panels into 2d.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap, colour = continent)) + 
  geom_point(size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  scale_colour_brewer(palette = "Dark2") +
  facet_grid(.~ continent)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-33-1.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap, colour = continent)) + 
  geom_point(size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  scale_colour_brewer(palette = "Dark2") +
  facet_grid(continent ~ .)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-33-2.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap, colour = continent)) + 
  geom_point(size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  scale_colour_brewer(palette = "Dark2") +
  facet_grid(continent ~ ., )
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-33-3.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap, colour = continent)) + 
  geom_point(size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  scale_colour_brewer(palette = "Dark2") +
  facet_wrap(continent ~ ., )
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-33-4.png)<!-- -->

By default, all axis have the same scale, using the argument scales = 'free' we can render the scales for each plot independent.


```r
# independent axis
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap, colour = continent)) + 
  geom_point(size = 3, shape = 19, alpha = 0.5, stroke = 1) +
  scale_colour_brewer(palette = "Dark2") +
  facet_wrap(continent ~ ., scales = 'free')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-34-1.png)<!-- -->


## Plot elements

### Title, captions and labels

The function `labs()` is used to add title and labels.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  labs(y = 'Life Expectancy', x = 'GDP per capita', title = 'Life Expectancy vs GDP per capita')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-35-1.png)<!-- -->

The function:

* `ggtitle()` adds title to a plot
* `xlab()` adds x-axis label
* `ylab()` adds y-axis label
* `labs()` adds all of the above


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  ggtitle('Life Expectancy vs GDP per capita', 
          subtitle = "Below $4000, Life expectancy does not vary with GDP") +
  ylab('Life Expectancy') +
  xlab('GDP per capita')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-36-1.png)<!-- -->

### Legend

The function `theme()` is used to customize the non-data components of a plot. We shall use it to customize legends.

Legend position
The argument legend.position determines the position of the legend. It accepts 'bottom', 'left', 'top' and 'right'.


```r
# position legend at the bottom
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  theme(legend.position = "bottom")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-37-1.png)<!-- -->


Removing legends using theme()
The argument legend.position = "none" removes all the legends in a plot.


```r
# removing legend
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-38-1.png)<!-- -->


### Removing legends using guides()

The function guides() removes legends by a specific scale. The legend of each scale can be removed by passing either 'none' or FALSE to it.


```r
# removing the size legend
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  theme(legend.position = "top") +
  guides(size = FALSE)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-39-1.png)<!-- -->


### Removing legend using geom

The argument `show.legend = F` within a geom, removes the legend of that geom.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent), show.legend = F) +
  scale_size_area(max_size = 12) +
  theme(legend.position = "top")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-40-1.png)<!-- -->


#### Legend title

The argument name within `scale_*` is used to control the legend title.


```r
# renaming legend
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  scale_colour_brewer(palette = "Dark2", name = 'Continents:') +
  theme(legend.position = "top")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-41-1.png)<!-- -->

```r
# drop legend title
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  scale_colour_brewer(palette = "Dark2", name = '') +
  theme(legend.position = "top")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-41-2.png)<!-- -->

####Changing legend labels

The argument label within `scale_*` is used to change legend labels.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  scale_colour_brewer(palette = "Dark2", name = '', label = c('AF', 'AM', 'AS', 'EU', 'OC')) +
  theme(legend.position = "top")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-42-1.png)<!-- -->


### Built-in themes

ggplot2 comes with some built-in themes for customizing plots. These includes:

theme_grey()
theme_bw()
theme_linedraw()
theme_light()
theme_dark()
theme_minimal()
theme_classic()
theme_void()
theme_test()


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  scale_colour_brewer(palette = "Dark2") +
  theme_bw() +
  theme(legend.position = "top")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-43-1.png)<!-- -->

```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(colour = continent)) +
  scale_colour_brewer(palette = "Dark2") +
  theme_bw() +
  theme_classic() +
  theme(legend.position = "bottom")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-43-2.png)<!-- -->


## Saving plots

There are two ways of saving plots in ggplot2 which are using:

* graphic devices
* `ggsave()`

### Saving plots using graphic devices

With this method, we must first open the graphic device using any of the following rendering functions:

* `pdf()`
* `svg()`
* `png()`
* `jpeg()`
* `tiff()`
* `bmp()`

Then we produce the plot and finally, we close the device using dev.off().


```r
# preparing plot
plt <- 
ggplot(data = gapminder_2007, aes(y = lifeExp, x = gdpPercap)) + 
  geom_point(alpha = 0.5, stroke = 1, aes(size = pop, colour = continent)) +
  scale_size_area(max_size = 12) +
  theme(legend.position = "top") +
  guides(size = FALSE) 

# initiating device
pdf('world.pdf', width = 8, height = 8)

# saving plot
print(plt)

# closing device
dev.off()
#> png 
#>   2

# initiating device
png('world.png', width = 800, height = 600)

# saving plot
print(plt)

# closing device
dev.off()
#> png 
#>   2

# checking files
file.exists(c('world.pdf', 'world.png'))
#> [1] TRUE TRUE

# removing files
file.remove(c('world.pdf', 'world.png'))
#> [1] TRUE TRUE
```


### Saving plots using ggsave()

The function ggsave() saves a plot directly to disc.


```r
ggsave('world.pdf', plt, width = 16, height = 16, units = 'cm')
ggsave('world.png', plt, width = 8, height = 8, units = 'cm')

# checking files
file.exists(c('world.pdf', 'world.png'))
#> [1] TRUE TRUE

# removing files
file.remove(c('world.pdf', 'world.png'))
#> [1] TRUE TRUE
```


## Statistical plots with ggplot2

### Bar and column chart

The functions `geom_bar()` and `geom_col()` are used to create bar charts. While the former works on a categorical column, returning a bar for the count of each category, the later requires a numeric column for the y-axis and category names for the x-axis.


```r
library(ggplot2)
library(dplyr)
library(gapminder)
library(RColorBrewer)

gapminder_2007 <- 
gapminder %>%
filter(year == '2007' & continent != 'Oceania') %>%
mutate(pop = round(pop/1e6, 1)) %>%
select(-year)
head(gapminder_2007)
#> # A tibble: 6 x 5
#>   country     continent lifeExp   pop gdpPercap
#>   <fct>       <fct>       <dbl> <dbl>     <dbl>
#> 1 Afghanistan Asia         43.8  31.9      975.
#> 2 Albania     Europe       76.4   3.6     5937.
#> 3 Algeria     Africa       72.3  33.3     6223.
#> 4 Angola      Africa       42.7  12.4     4797.
#> 5 Argentina   Americas     75.3  40.3    12779.
#> 6 Austria     Europe       79.8   8.2    36126.

# count of countries by continent
ggplot(gapminder_2007, aes(x = continent)) + 
   geom_bar()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-46-1.png)<!-- -->

```r


# preparing data
pop_2007 <- 
gapminder_2007 %>%
group_by(continent) %>%
summarise(pop = sum(pop, na.rm = T))
pop_2007
#> # A tibble: 4 x 2
#>   continent   pop
#>   <fct>     <dbl>
#> 1 Africa     930.
#> 2 Americas   899.
#> 3 Asia      3812.
#> 4 Europe     586.

# population by continent
pop_2007 %>%
ggplot(aes(x = continent, y = pop)) + 
   geom_col()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-46-2.png)<!-- -->

```r


# sorting columns ascending
ggplot(pop_2007, aes(x = reorder(continent, pop), y = pop)) + 
   geom_col()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-46-3.png)<!-- -->

```r
# sorting columns descending
ggplot(pop_2007, aes(x = reorder(continent, desc(pop)), y = pop)) + 
   geom_col()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-46-4.png)<!-- -->


#### Borders and colours

The argument:

* `fill=`: fills bars
* `colour=`: colours borders
* `size=`: controls border size
* `width=`: controls bar width


```r
ggplot(pop_2007, aes(x = reorder(continent, desc(pop)), y = pop)) + 
   geom_col(fill = 'lightgreen', colour = 'darkgreen', alpha = 0.5, size = 0.8, width = 0.7) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-47-1.png)<!-- -->


#### Adding labels

The functions `geom_text()` and `geom_label()` are used to add data labels.


```r
ggplot(data = pop_2007, aes(x = reorder(continent, desc(pop)), y = pop)) + 
   geom_col(fill = 'lightgreen', colour = 'darkgreen', alpha = 0.5) +
   geom_text(aes(label = round(pop)), nudge_y = 90) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-48-1.png)<!-- -->

```r
# placing label at centre of bars
ggplot(data = pop_2007) + 
geom_col(aes(x = reorder(continent, desc(pop)), y = pop), 
         fill = 'lightgreen', colour = 'darkgreen', alpha = 0.5) +
   geom_label(aes(x = reorder(continent, desc(pop)), 
                  y = pop/2, label = round(pop)), nudge_y = 100) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-48-2.png)<!-- -->


#### Customizing plot


```r
ggplot(pop_2007, aes(x = reorder(continent, desc(pop)), y = pop)) + 
   geom_col(fill = 'lightgreen', colour = 'darkgreen', alpha = 0.5) +
   geom_text(aes(label = round(pop)), nudge_y = 90) + 
   ggtitle('2007 World Population by Continents', 
           subtitle = "Asia accounts for more than half of the world's population") +
   xlab('Continents') +
   ylab('Pop in Millions') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-49-1.png)<!-- -->


#### Column chart

Using the function `coord_flip()`, we can flip a bar chart into a column chart.


```r
# producing a column chart
ggplot(pop_2007, aes(x = reorder(continent, pop), y = pop)) + 
   geom_col(fill = 'lightgreen', colour = 'darkgreen', alpha = 0.5) +
   labs(x = 'Continents',y = 'Pop in Millions',title = '2007 World Population by Continents') +
   geom_label(aes(label = round(pop), y = pop/2)) +
   theme_classic() +
   coord_flip()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-50-1.png)<!-- -->


#### Stacked bar chart

To create stacked column bars, we use the fill argument by mapping it to a continuous variable.


```r
# preparing data
dt <- 
gapminder %>%
filter(year >= 1992) %>%
group_by(year, continent) %>%
summarise(pop = round(sum(pop/1e6, na.rm = T)))
head(dt)
#> # A tibble: 6 x 3
#> # Groups:   year [2]
#>    year continent   pop
#>   <int> <fct>     <dbl>
#> 1  1992 Africa      659
#> 2  1992 Americas    739
#> 3  1992 Asia       3133
#> 4  1992 Europe      558
#> 5  1992 Oceania      21
#> 6  1997 Africa      744

# producing a stacked bar chart
ggplot(dt, aes(x = as.factor(year), y = pop, fill = reorder(continent, pop))) + 
   geom_col() +
   theme_classic() +
   scale_fill_brewer(palette = "Dark2")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-51-1.png)<!-- -->


#### The 100% stacked bar chart

To create a 100% stacked bar chart, we set `position = "fill"` inside `geom_col()`.


```r
ggplot(dt, aes(x = as.factor(year), y = pop, fill = reorder(continent, pop))) + 
   geom_col(position = "fill") +
   theme_classic() +
   scale_fill_brewer(palette = "Dark2")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-52-1.png)<!-- -->


#### Clustered bar chart

To create a clustered bar chart, we set `position = "dodge"` inside `geom_col()`.


```r
ggplot(dt, aes(x = as.factor(year), y = pop, fill = reorder(continent, pop))) + 
   geom_col(position = "dodge") +
   theme_classic() +
   scale_fill_brewer(palette = "Dark2")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-53-1.png)<!-- -->

```r


# adding space between bars
ggplot(dt, aes(x = as.factor(year), y = pop, fill = reorder(continent, pop))) + 
   geom_col(position = position_dodge(width = 1)) +
   theme_classic() +
   scale_fill_brewer(palette = "Dark2")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-53-2.png)<!-- -->

```r


# adding data labels
ggplot(dt, aes(x = as.factor(year), y = pop, fill = reorder(continent, pop))) + 
   geom_col(position = position_dodge(width = 1)) +
   theme_classic() +
   scale_fill_brewer(palette = "Dark2") +
   geom_text(aes(label = round(pop), y = pop), position = position_dodge(0.9), 
             size = 3, vjust = -0.5, hjust = 0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-53-3.png)<!-- -->


### Pie chart

There is no geom for producing pie charts but by using coord_polar(), we can produce pie charts.


```r
# data
pop_2007
#> # A tibble: 4 x 2
#>   continent   pop
#>   <fct>     <dbl>
#> 1 Africa     930.
#> 2 Americas   899.
#> 3 Asia      3812.
#> 4 Europe     586.

ggplot(pop_2007, aes(y = pop, x = '', fill = continent)) + 
   geom_col() +
   coord_polar("y", start = 0)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-54-1.png)<!-- -->


#### Customizing plot


```r
ggplot(pop_2007, aes(y = pop, x = '', fill = continent)) + 
   geom_col(colour = grey(0.85), size = 0.5) +
   coord_polar("y", start = 0) +
   scale_fill_brewer(palette = "Dark2", label = c('Americas', 'Africa', 'Asia', 'Europe')) +
   theme_minimal() +
   labs(x = '', y = '') +
   theme(legend.position = "top", 
         axis.ticks = element_blank(), 
         panel.grid=element_blank(), 
         axis.text.x=element_blank(), 
         legend.title = element_blank()
)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-55-1.png)<!-- -->


#### Adding data labels


```r
# preparing label
pop_2007 %>%
arrange(desc(pop)) %>%
mutate(label_y = cumsum(pop))
#> # A tibble: 4 x 3
#>   continent   pop label_y
#>   <fct>     <dbl>   <dbl>
#> 1 Asia      3812.   3812.
#> 2 Africa     930.   4742.
#> 3 Americas   899.   5640.
#> 4 Europe     586.   6227.

pop_2007 %>%
arrange(desc(pop)) %>%
mutate(label_y = cumsum(pop)) %>%

ggplot(aes(y = pop, x = '', fill = continent)) + 
   geom_col(colour = grey(0.85), size = 0.5) +
   coord_polar("y", start = 0) +
   scale_fill_brewer(palette = "Dark2", label = c('Americas', 'Africa', 'Asia', 'Europe')) +
   theme_minimal() +
   labs(x = '', y = '') +
   theme(legend.position = "top", 
         axis.ticks = element_blank(), 
         panel.grid=element_blank(), 
         axis.text.x=element_blank(), 
         legend.title = element_blank()) +
   geom_text(aes(y = label_y, label = round(pop)), hjust = -0.5)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-56-1.png)<!-- -->

```r

# preparing data
pop_2007 %>%
arrange(desc(pop)) %>%
mutate(label_y = cumsum(pop)) %>%
mutate(label_per = round(pop/sum(pop),3))
#> # A tibble: 4 x 4
#>   continent   pop label_y label_per
#>   <fct>     <dbl>   <dbl>     <dbl>
#> 1 Asia      3812.   3812.     0.612
#> 2 Africa     930.   4742.     0.149
#> 3 Americas   899.   5640.     0.144
#> 4 Europe     586.   6227.     0.094

pop_2007 %>%
arrange(desc(pop)) %>%
mutate(label_y = cumsum(pop)) %>%
mutate(label_per = round(pop/sum(pop),3)) %>%

ggplot(aes(y = pop, x = '', fill = continent)) + 
   geom_col(colour = grey(0.85), size = 0.5) +
   coord_polar("y", start = 0) +
   scale_fill_brewer(palette = "Dark2") +
   theme_minimal() +
   labs(x = '', y = '') +
   theme(legend.position = "none", 
         axis.ticks = element_blank(),
         panel.grid=element_blank(), 
         axis.text.x=element_blank(), 
         legend.title = element_blank()) +
geom_text(aes(y = label_y, label = paste0(continent,':- ', scales::percent(label_per, 0.1))), 
          hjust = 0.1, size = 4, colour = grey(0.25))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-56-2.png)<!-- -->


### Dot plot

#### Wilkinson dot plot

The function geom_dotplot() is used to create a dot plot.


```r
ggplot(gapminder_2007, aes(x = lifeExp)) +
   geom_dotplot() +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-57-1.png)<!-- -->

```r


ggplot(gapminder_2007, aes(x = lifeExp)) +
   geom_dotplot(aes(fill = continent), alpha = 0.5, colour = NA) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-57-2.png)<!-- -->

```r


ggplot(gapminder_2007, aes(x = lifeExp)) +
   geom_dotplot(aes(fill = continent), alpha = 0.5, colour = NA, method = 'histodot') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-57-3.png)<!-- -->


#### Grouped dot plot


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = continent)) + 
   geom_dotplot(binaxis = 'y', stackdir = 'center') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-58-1.png)<!-- -->


#### Customizing plot


```r
ggplot(data = gapminder_2007, 
aes(y = lifeExp, x = continent, colour = continent, fill = continent)) + 
   geom_dotplot(binaxis = 'y', stackdir = 'center', dotsize = 0.6, alpha = 0.5) +
   theme(legend.position = "none") +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-59-1.png)<!-- -->


### Histogram

The function geom_histogram() is used to create histograms.


```r
ggplot(gapminder_2007) +
   geom_histogram(aes(x = lifeExp)) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-60-1.png)<!-- -->


#### Controlling the number of bins
The argument bins controls the number of bins.


```r
ggplot(gapminder_2007) +
   geom_histogram(aes(x = lifeExp), bins = 10) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-61-1.png)<!-- -->



#### Controlling bin size
The argument binwidth controls the width of the bins.


```r
ggplot(gapminder_2007) +
   geom_histogram(aes(x = lifeExp), binwidth = 5) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-62-1.png)<!-- -->

#### Colour and fill


```r
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_histogram(binwidth = 3, fill = 'black', colour = 'white') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-63-1.png)<!-- -->


#### Density Histogram


The argument `y = ..density..` is used to create a density histogram. By default, histograms are count but to combine them with density plot, we need to convert them to density histograms.


```r
ggplot(gapminder_2007, aes(x = lifeExp, y = ..density..)) + 
   geom_histogram(fill = 'black', colour = 'white', binwidth = 3) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-64-1.png)<!-- -->


### Density plot


The function `geom_density()` creates density plots.


```r
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_density(colour = 'blue', size = 0.5) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-65-1.png)<!-- -->

```r


# expanding x-axis
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_density(colour = 'blue', size = 0.5) +
   theme_classic() +
xlim(30, 95)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-65-2.png)<!-- -->

```r


# filling area under the curve
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_density(colour = NA, fill = 'lightgreen', alpha = 0.7) +
   theme_classic() +
   xlim(30, 95)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-65-3.png)<!-- -->

```r


# fill and colour
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_density(colour = 'blue', fill = 'lightgreen', alpha = 0.7) +
   theme_classic() +
   xlim(30, 95)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-65-4.png)<!-- -->

```r


# plotting density with geom_line()
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_line(colour = 3, stat = 'density', size = 0.8, adjust = 0.5) +
   geom_line(colour = 4, stat = 'density', size = 0.8, adjust = 1) +
   geom_line(colour = 5, stat = 'density', size = 0.8, adjust = 1.5) +
   geom_line(colour = 6, stat = 'density', size = 0.8, adjust = 2) +
   theme_classic() +
   xlim(25, 95)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-65-5.png)<!-- -->

#### Adding rug


```r
# adding rug
ggplot(gapminder_2007, aes(x = lifeExp)) + 
   geom_density(colour = 3) +
   xlim(30, 95) +
   theme_classic() +
   geom_rug() 
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-66-1.png)<!-- -->


#### Density plot by groups


```r
# by groups
ggplot(gapminder_2007, aes(x = lifeExp, colour = continent)) +
   geom_density(size = 0.5, alpha = 0.5) +
   xlim(30, 95) +
   geom_rug() +
   theme_classic() 
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-67-1.png)<!-- -->

```r
# subplots
ggplot(gapminder_2007, aes(x = lifeExp, colour = continent)) +
   geom_density(size = 0.5, alpha = 0.5) +
   xlim(30, 95) +
   theme_light() +
   facet_wrap(continent ~ ., nrow = 5, ncol = 1, scales = 'free_y')
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-67-2.png)<!-- -->

#### Combining density and histogram


```r
# combining density and histogram
ggplot(gapminder_2007, aes(x = lifeExp, y = ..density..)) + 
   geom_density(colour = 3, size = 0.5) +
   geom_histogram(alpha = 0.3, bins = 15) +
   theme_classic() +
   xlim(30, 95)
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-68-1.png)<!-- -->


### Q-Q plot


The function `geom_qq()` creates a q-q plot.


```r
ggplot(data = gapminder_2007) + 
geom_qq(aes(sample = lifeExp)) +
theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-69-1.png)<!-- -->

```r


# adding a line
ggplot(data = gapminder_2007, aes(sample = lifeExp)) + 
   geom_qq() + 
   geom_qq_line() +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-69-2.png)<!-- -->

```r


# by groups
ggplot(data = gapminder_2007, aes(sample = lifeExp, colour = continent, shape = continent)) + 
   geom_qq(size = 2) + 
   geom_qq_line() +
   scale_colour_brewer(palette = "Dark2") +
   scale_shape_manual(values = 15:19) +
   guides(shape = 'none') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-69-3.png)<!-- -->



### Boxplot

The function `geom_boxplot()` creates a boxplot.


```r
ggplot(data = gapminder_2007) + 
   geom_boxplot(aes(y = lifeExp))
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-70-1.png)<!-- -->


#### Customizing plot


```r
ggplot(data = gapminder_2007, aes(y = lifeExp)) + 
   geom_boxplot(width = 20, 
                fill = 'lightgreen', 
                colour = 'darkgreen', 
                alpha = 0.7,
                size = 0.5) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-71-1.png)<!-- -->


#### Adding notch


The argument notch is used to add notch while notchwidth is used to adjust notch size.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp)) + 
   geom_boxplot(fill = 'lightgreen', 
                colour = 'darkgreen', 
                alpha = 0.5,
                size = 0.6,
                notch = TRUE, 
                notchwidth = 0.7) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-72-1.png)<!-- -->


#### Boxplot by groups


```r
ggplot(data = gapminder_2007) + 
   geom_boxplot(aes(y = lifeExp, x = continent), 
                fill = 'lightgreen', 
                colour = 'darkgreen',
                alpha = 0.5,
                size = 0.7) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-73-1.png)<!-- -->


#### Removing outliers

The argument `outlier.shape = NA` is used to remove outliers.


```r
# removing outliers
ggplot(data = gapminder_2007) + 
   geom_boxplot(aes(y = gdpPercap, x = continent), 
                fill = 'lightgreen', 
                colour = 'darkgreen', 
                size = 0.6, 
                alpha = 0.6, 
                outlier.shape = NA) +
   coord_flip() +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-74-1.png)<!-- -->


#### Box width

The argument width controls box width.


```r
# box width
ggplot(data = gapminder_2007) + 
   geom_boxplot(aes(y = gdpPercap, x = continent), 
                fill = 'lightgreen', 
                colour = 'darkgreen', 
                size = 0.6, 
                alpha = 0.6, 
                outlier.shape = NA, 
                width = 0.3) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-75-1.png)<!-- -->


The argument `varwidth = TRUE` enables box width to be proportionate to the square root of the count of values for each group.



```r
# width by the count of values
ggplot(data = gapminder_2007) + 
   geom_boxplot(aes(y = gdpPercap, x = continent), 
                fill = 'lightgreen', 
                colour = 'darkgreen', 
                size = 0.6, 
                alpha = 0.6,              
                outlier.shape = NA, 
                varwidth = TRUE) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-76-1.png)<!-- -->


#### Adding mean and median

The function `stat_summary()` can be used to add both mean and median values.


```r
# adding mean
ggplot(data = gapminder_2007, aes(y = lifeExp, x = continent), ) + 
   geom_boxplot(fill = 'lightgreen', 
                colour = 'darkgreen', 
                size = 0.6, 
                alpha = 0.6, 
                width = 0.4) +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 10, colour = 'white') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-77-1.png)<!-- -->


#### Adding jitter

The function `geom_jitter()` is used to add jitter to a plot.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = continent)) + 
   geom_boxplot(fill = 'lightgreen', 
                colour = 'darkgreen', 
                size = 0.6, 
                alpha = 0.6, 
                width = 0.3) +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 10, colour = 'white') +
   geom_jitter(width = 0.2, alpha = 0.7, colour = 'darkgreen') +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-78-1.png)<!-- -->


### Strip plot

There is no specific geom to create a strip plot but using `geom_jitter()`, we can create a strip plot.


```r
ggplot(data = gapminder_2007, aes(x = lifeExp, y = continent, colour = continent)) + 
   geom_jitter() +
   theme_classic() +
   theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-79-1.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(x = lifeExp, y = continent, colour = continent)) + 
   geom_jitter(position = position_jitter(height = 0.1)) +
   theme_classic() +
   theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-79-2.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(y = lifeExp, x = continent, colour = continent)) + 
   geom_jitter(position = position_jitter(width = 0.2)) +
   theme_classic() +
   theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-79-3.png)<!-- -->

```r


ggplot(data = gapminder_2007, 
       aes(y = lifeExp, x = continent, colour = continent, fill = continent)) + 
   geom_boxplot(size = 0.3, alpha = 0.6, width = 0.3) +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 8) +
   geom_jitter(position = position_jitter(width = 0.2), alpha = 0.5) +
   scale_colour_brewer(palette = "Dark2") +
   scale_fill_brewer(palette = "Dark2") +
   theme_classic() +
   theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-79-4.png)<!-- -->


### Violin plot

The function `geom_violin()` creates a violin plot.


```r
ggplot(data = gapminder_2007, aes(y = lifeExp, x = '')) + 
   geom_violin() +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-80-1.png)<!-- -->


#### Remove trimming

The argument `trim = FALSE` removes trimming.


```r
# removing trim
ggplot(data = gapminder_2007, aes(y = lifeExp, x = '')) + 
   geom_violin(trim = FALSE) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-81-1.png)<!-- -->


#### Adding mean and median


```r
# adding mean and median
ggplot(data = gapminder_2007, aes(y = lifeExp, x = '')) + 
   geom_violin(trim = FALSE) +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 10) +
   stat_summary(fun.y = median, geom = 'point', shape = 19, size = 3) +
   theme_classic() 
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-82-1.png)<!-- -->

```r


ggplot(data = gapminder_2007, aes(y = lifeExp, x = continent)) + 
   geom_violin() +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 10) +
   stat_summary(fun.y = median, geom = 'point', shape = 19, size = 3) +
   theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-82-2.png)<!-- -->

```r


ggplot(data = gapminder_2007, 
       aes(y = lifeExp, x = continent, color = continent, shape = continent)) + 
   geom_violin(size = 0.8) +
   stat_summary(fun.y = mean, geom = 'point', shape = '-', size = 10) +
   stat_summary(fun.y = median, geom = 'point', shape = 19, size = 3) +
   geom_jitter(position = position_jitter(width = 0.2), alpha = 0.7) +
   scale_colour_brewer(palette = "Dark2") +
   theme_classic() +
   theme(legend.position = "none")
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-82-3.png)<!-- -->


### Line graph

The function `geom_line()` produces a line plot.


```r
# preparing plot
pop_growth <-
gapminder %>%
group_by(year) %>%
summarise(pop = round(sum(pop/1e9, na.rm = T), 2))
pop_growth
#> # A tibble: 12 x 2
#>     year   pop
#>    <int> <dbl>
#>  1  1952  2.41
#>  2  1957  2.66
#>  3  1962  2.9 
#>  4  1967  3.22
#>  5  1972  3.58
#>  6  1977  3.93
#>  7  1982  4.29
#>  8  1987  4.69
#>  9  1992  5.11
#> 10  1997  5.52
#> 11  2002  5.89
#> 12  2007  6.25

ggplot(data = pop_growth, aes(y = pop/1e9, x = year)) + 
  geom_point()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-83-1.png)<!-- -->

```r


# adding line
ggplot(data = pop_growth, aes(y = pop/1e9, x = year)) + 
  geom_line()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-83-2.png)<!-- -->

```r


# combining line and points
ggplot(data = pop_growth, aes(y = pop/1e9, x = year)) + 
  geom_line() + 
  geom_point()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-83-3.png)<!-- -->

```r


# adding data label
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_line() + 
  geom_point() +
  geom_text(aes(label = round(pop, 2)), nudge_x = -3) +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-83-4.png)<!-- -->

```r


ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_segment(aes(y = pop, x = year, yend = 0, xend = year)) +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-83-5.png)<!-- -->



#### Line width

The argument `size=`, control line width.


```r
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_line(size = 1) +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-84-1.png)<!-- -->


#### Line style

The argument `linetype=` controls line style. It accepts the same values as base graphics that is, integers ranging from 0 to 6 and

* ‘blank’ = 0,
* ‘solid’ = 1 (default)
* ‘dashed’ = 2
* ‘dotted’ = 3
* ‘dotdash’ = 4
* ‘longdash’ = 5
* ‘twodash’ = 6


```r
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_line(size = 1, linetype = 2) +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-85-1.png)<!-- -->

```r

ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_line(size = 1, linetype = 'twodash') +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-85-2.png)<!-- -->


#### Multiple line plot


```r
# preparing data
pop_growth_cont <- aggregate(pop ~ year + continent, gapminder, sum)
head(pop_growth_cont)
#>   year continent       pop
#> 1 1952    Africa 237640501
#> 2 1957    Africa 264837738
#> 3 1962    Africa 296516865
#> 4 1967    Africa 335289489
#> 5 1972    Africa 379879541
#> 6 1977    Africa 433061021

ggplot(data = pop_growth_cont, 
       aes(y = pop/1e6, x = year, colour = continent, fill = continent)) + 
  geom_line() + 
  geom_point()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-86-1.png)<!-- -->

```r
ggplot(data = pop_growth_cont, aes(y = pop, x = year, colour = continent, fill = continent)) + 
  geom_area() + 
  scale_colour_brewer(palette = "Dark2") +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-86-2.png)<!-- -->


### Lollipop plot

By combining the functions `geom_segment()` and `geom_point()`, we can produce a lollipop plot.


```r
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_segment(aes(yend = 0, xend = year)) +
  geom_point(aes(y = pop, x = year), size = 3) +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-87-1.png)<!-- -->

### Area plot

The function `geom_area()` is used to create an area plot.


```r
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_area() +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-88-1.png)<!-- -->



### Step plot

The function `geom_step()` is used to create a step plot with the argument direction indicating the direction of the plot.


```r
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_step(aes(y = pop, x = year)) + 
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-89-1.png)<!-- -->

```r
# vh (vertical then horizontal)
ggplot(data = pop_growth, aes(y = pop, x = year)) + 
  geom_step(aes(y = pop, x = year), direction = 'vh') +
  theme_classic()
```

![](05-ggplot2_files/figure-epub3/unnamed-chunk-89-2.png)<!-- -->
