---
title: "Homework 2"
author: "William Holley"
date: "2025-01-10"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---

## Instructions
Answer the following questions and/or complete the exercises in RMarkdown. Please embed all of your code and push the final work to your repository. Your report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

**1. Objects in R are a way in which we can store data or operations. Make a new object `pi` as 3.14159. You should now see the object `pi` in the environment window in the top right.** 

``` r
pi <- 3.14159
```

**2. Write a code chunk that divides `pi` by 2. Use the help command `?` to learn how to use the `round` function to limit your result to 3 significant digits.**  

``` r
signif(pi/2, 3) #both of these work, is one better to use?
```

```
## [1] 1.57
```

``` r
round(pi/2, 2)
```

```
## [1] 1.57
```

**3. Calculate the mean for the numbers 2, 8, 4, 6, 7, 4, 9, 9, 10. Please start by making a new object `x` that holds these values then use `mean` to perform the calculation.**  

``` r
x <- c(2, 8, 4, 6, 7, 4, 9, 9, 19)
mean(x)
```

```
## [1] 7.555556
```

**4. Make five new vectors that show the name, height in feet, and height in meters of the five tallest mountains in the world.**

``` r
name <- c("Mount Everest", "K2", "Kangchenjunga", "Lhotse", "Makalu")
height_f <- c(29032, 28251, 28169, 27940, 27838)
height_m <- c(8849, 8611, 8586, 8516, 8485)
```

**5. Combine these vectors into a data frame called `mountains`.**

``` r
mountains <- data.frame(name, height_f, height_m)
```

**6. What is the mean height of the mountains in feet?**

``` r
mean(height_f)
```

```
## [1] 28246
```

**7. When were each of these mountains first climbed (i.e. in what year)? Make a new vector `first_climbed` and add it to the `mountains` data frame.**

``` r
first_climbed <- c(1953, 1954, 1955, 1956, 1955)
mountains <- data.frame(name, height_f, height_m, first_climbed)
```

**8. How many times have each of these mountains been climbed? Make a new vector `summits` and add it to the `mountains` data frame.**

``` r
summits <- c(12884, 800, 532, 933, 499)
mountains <- data.frame(name, height_f, height_m, first_climbed, summits)
```

**9. Which mountain has the highest number of fatalities? Make a new vector `fatalities` and add it to the `mountains` data frame.**

``` r
fatalities <- c(335, 96, 52, 20, 22)
mountains <- data.frame(name, height_f, height_m, first_climbed, summits, fatalities)
```

**10. Write your data frame to a .csv file.**

``` r
write.csv(mountains, "mountains_data.csv", row.names=FALSE)
mountains
```

```
##            name height_f height_m first_climbed summits fatalities
## 1 Mount Everest    29032     8849          1953   12884        335
## 2            K2    28251     8611          1954     800         96
## 3 Kangchenjunga    28169     8586          1955     532         52
## 4        Lhotse    27940     8516          1956     933         20
## 5        Makalu    27838     8485          1955     499         22
```

## Knit and Upload
Please knit your work as a .pdf or .html file and upload to Canvas. Homework is due before the start of the next lab. No late work is accepted. Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  
