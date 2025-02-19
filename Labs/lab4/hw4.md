---
title: "Homework 4"
author: "William Holley"
date: "2025-01-21"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and/or complete the exercises in RMarkdown. Please embed all of your code and push the final work to your repository. Your report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Load the tidyverse

``` r
library(tidyverse)
```

## Data 
For this assignment, we are going to use built-in data on mammal sleep patterns `mleep`. The data are taken from: V. M. Savage and G. B. West. A quantitative, theoretical framework for understanding mammalian sleep. Proceedings of the National Academy of Sciences, 104 (3):1051-1056, 2007.  

Since the data are built-in, they do not need to be stored as a separate data frame in order to use them.  

**1. Learn about the data and variables by using the help function in R.**

``` r
help(msleep)
```

**2. What are the names of the variables in msleep?**  

``` r
names(msleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```

**3. Use one of the summary functions you have learned to get an idea of the structure of the data.**  

``` r
summary(msleep)
```

```
##      name              genus               vore              order          
##  Length:83          Length:83          Length:83          Length:83         
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  conservation        sleep_total      sleep_rem      sleep_cycle    
##  Length:83          Min.   : 1.90   Min.   :0.100   Min.   :0.1167  
##  Class :character   1st Qu.: 7.85   1st Qu.:0.900   1st Qu.:0.1833  
##  Mode  :character   Median :10.10   Median :1.500   Median :0.3333  
##                     Mean   :10.43   Mean   :1.875   Mean   :0.4396  
##                     3rd Qu.:13.75   3rd Qu.:2.400   3rd Qu.:0.5792  
##                     Max.   :19.90   Max.   :6.600   Max.   :1.5000  
##                                     NA's   :22      NA's   :51      
##      awake          brainwt            bodywt        
##  Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
##  1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
##  Median :13.90   Median :0.01240   Median :   1.670  
##  Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
##  3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
##  Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
##                  NA's   :27
```


``` r
glimpse(msleep)
```

```
## Rows: 83
## Columns: 11
## $ name         <chr> "Cheetah", "Owl monkey", "Mountain beaver", "Greater shor…
## $ genus        <chr> "Acinonyx", "Aotus", "Aplodontia", "Blarina", "Bos", "Bra…
## $ vore         <chr> "carni", "omni", "herbi", "omni", "herbi", "herbi", "carn…
## $ order        <chr> "Carnivora", "Primates", "Rodentia", "Soricomorpha", "Art…
## $ conservation <chr> "lc", NA, "nt", "lc", "domesticated", NA, "vu", NA, "dome…
## $ sleep_total  <dbl> 12.1, 17.0, 14.4, 14.9, 4.0, 14.4, 8.7, 7.0, 10.1, 3.0, 5…
## $ sleep_rem    <dbl> NA, 1.8, 2.4, 2.3, 0.7, 2.2, 1.4, NA, 2.9, NA, 0.6, 0.8, …
## $ sleep_cycle  <dbl> NA, NA, NA, 0.1333333, 0.6666667, 0.7666667, 0.3833333, N…
## $ awake        <dbl> 11.9, 7.0, 9.6, 9.1, 20.0, 9.6, 15.3, 17.0, 13.9, 21.0, 1…
## $ brainwt      <dbl> NA, 0.01550, NA, 0.00029, 0.42300, NA, NA, NA, 0.07000, 0…
## $ bodywt       <dbl> 50.000, 0.480, 1.350, 0.019, 600.000, 3.850, 20.490, 0.04…
```

**4. The variable `conservation` categorizes the conservation status of the mammals in the data. How many mammals are endangered?**

``` r
filter(msleep, conservation == "en")
```

```
## # A tibble: 4 × 11
##   name    genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr>   <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Asian … Elep… herbi Prob… en                   3.9      NA          NA    20.1
## 2 Golden… Meso… herbi Rode… en                  14.3       3.1         0.2   9.7
## 3 Tiger   Pant… carni Carn… en                  15.8      NA          NA     8.2
## 4 Giant … Prio… inse… Cing… en                  18.1       6.1        NA     5.9
## # ℹ 2 more variables: brainwt <dbl>, bodywt <dbl>
```
4 mammals are endangered: the Asian Elephant, Golden Hamster, Tiger, and Giant Armadillo.

**5. Use `filter` to pull out the endangered mammals. Store this as a new object called `endangered`.**

``` r
endangered <- filter(msleep, conservation == "en")
```

**6. The variable `vore` categorizes the feeding strategy of the mammals in the data. How many mammals are in each category of `vore`?**

``` r
count(msleep, vore)
```

```
## # A tibble: 5 × 2
##   vore        n
##   <chr>   <int>
## 1 carni      19
## 2 herbi      32
## 3 insecti     5
## 4 omni       20
## 5 <NA>        7
```
There are 19 carnivores, 32 herbivores, 5 insectivores, 20 omnivores, and 7 NAs.

**7. Use `filter` to find the insectivore(s) with endangered status.**

``` r
filter(msleep, vore == "insecti", conservation =="en")
```

```
## # A tibble: 1 × 11
##   name    genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr>   <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Giant … Prio… inse… Cing… en                  18.1       6.1          NA   5.9
## # ℹ 2 more variables: brainwt <dbl>, bodywt <dbl>
```

**8. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.**

``` r
small <- filter(msleep, bodywt <= 1)
large <- filter(msleep, 200 <= bodywt)
```

**9. Do large or small animals sleep longer on average?** 

``` r
mean(small$sleep_total)
```

```
## [1] 12.65833
```


``` r
mean(large$sleep_total)
```

```
## [1] 3.3
```
Small animals sleep longer on average.

**10. Which animal sleeps the least among the entire dataframe?**

``` r
min(msleep$sleep_total)
```

```
## [1] 1.9
```

``` r
filter(msleep, sleep_total == "1.9")
```

```
## # A tibble: 1 × 11
##   name    genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr>   <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Giraffe Gira… herbi Arti… cd                   1.9       0.4          NA  22.1
## # ℹ 2 more variables: brainwt <dbl>, bodywt <dbl>
```
The Giraffe sleeps the least at only 1.9 hours.

## Knit and Upload
Please knit your work as a .pdf or .html file and upload to Canvas. Homework is due before the start of the next lab. No late work is accepted. Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  
