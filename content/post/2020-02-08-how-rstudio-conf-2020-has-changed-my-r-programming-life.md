---
title: How RStudio::Conf 2020 has changed my (R programming) life
author: Sifan
date: '2020-02-08'
slug: how-rstudio-conf-2020-has-changed-my-r-programming-life
categories:
  - R
tags:
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-02-08T17:33:14-05:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

This year I had the opportunity to attend the [RStudio::Conf](https://rstudio.com/conference/) as one of the [Diversity Scholarship recipients](https://blog.rstudio.com/2019/08/30/diversity-scholarships/). 

Like most of the R users, I'm largely self-taught with weird gaps and false beliefs about R. Furthermore, the open source nature of R language also makes it hard to catch up with all the latest updates and trends that are most relevent. Attending conference turned out to be a great way to recognize my limitations, and be aware of all the new developments. 

Here are some of my previous false beliefs about R and how that has changed.

> ## copy+paste+google is the only way to debug my R code because the Error message doesn't make any sense

Let's admit it, debugging from a mysterious error message is hard. So my first reaction is always copy the entire error message and google it, and hoping someone has already figured it out somewhere on the web.  

But there's a more effective way! Jenny's awesome [keynote](https://resources.rstudio.com/rstudio-conf-2020/object-of-type-closure-is-not-subsettable-jenny-bryan) walks through "four stages of debugging": 
1. Reset: Restart R session - it seems that the wisdom of turning things off and on applies to everything. 

2. Reproducible Example: Try narrow down the problem by creating a **minimal** **REPR**oducible **EX**ample, using only what is needed to see the problem. 

*(Bonus: there's even a [`REPREX`](https://github.com/tidyverse/reprex#readme) package that makes it easier to prepare your R code for posting on StackOverflow/GitHub/Slack when asking for help!)*

3. Debug:use `traceback()`, `browser()`, and `debug()`, R's built-in functions that help you to diagnose what went wrong. Read more about the detailed strategies here in this [Debugging](https://rstats.wtf/debugging-r-code.html) chapter. 

4. Deter: write test and assertations into functions to plan for the unexpected. The [`testthat`](https://testthat.r-lib.org/) package is built specifically for this purpose. 


> ## 	`.Rprofile` ? `.Renviron`? Um, these dotfiles seem weird, I  better not mess up with these.

Actually, these are files that help you to customize your R sessions. `.Renviron` contains *R global variables* you want to load at every start up, which is most useful for storing sensitive information such as your census API keys, or GitHub PAT. `.Rprofile` contains *R code* you want to run at every R start up, such as `usethis` for your analysis workflow, or `skimr` for displaying summary statistics. Note that you should not load packages that used in actual analysis like `tidyverse` because that would not be reproducibile on other machines. 

Here's what I decided to include in my `.Rprofile` for now!

```r
# 1. loading packages that are useful for workflow

  library(usethis)
  library(devtools)
  library(skimr)
  
# 2. Get a fortune cookie! (just for fun...)
  if (interactive()) 
    { # (requires fortunes package)
      fortunes::fortune()
    }
```

Again, Jenny has a great chapter here explaining these two files on [R startup](https://rstats.wtf/r-startup.html).


> ##  Only R developers write packages so that has nothing to do with me. 

Surprise! R packages are useful even if you never share your code! In Hadley's word, *"Organising code in a package makes your life easier because packages come with conventions"*. In this sense, packages create a perfect structure for any data analyses preojcts. where `/R` contains all your functions, and `/data` contains all datasets you need. RMD files that you use to generate report can go in `/vignettes`. 

Sharla demonstrated a great [case study](https://resources.rstudio.com/rstudio-conf-2020/dont-repeat-yourself-talk-to-yourself-repeated-reporting-in-the-r-universe-sharla-gelfand) of using R package to create reproducible data analysis report. 

Another great use of R package is for creating a personal repository of functions. It might be a function you came across that you found useful, or something that you wrote and use quite often. Wrapping those functions in one package makes it so much easier to track. 

> ##  I wish there was a `tidyverse` for machine learning… 

Well, actually there is! It's [tidymodels](https://www.tidyverse.org/blog/2018/08/tidymodels-0-0-1/). It contains everything from defining [recipes](https://tidymodels.github.io/recipes/) to encode and preprocess different datasets, to help [tune](https://tidymodels.github.io/tune/articles/getting_started.html) parameters for your model. 

If you are familiar with `caret`, `tidymodels` is created by the same author (Max Kuhn) who wanted to correct for the "mistakes" in `caret` development :wink:. Watch Max's [talk](https://resources.rstudio.com/rstudio-conf-2020/total-tidy-tuning-techniques-max-kuhn), or read about Alison Hill's [summary](https://education.rstudio.com/blog/2020/02/conf20-intro-ml/) of her Intro to Machine Learning workshop at this year's conference. 

> ##  `ggplot2` is great, but let me copy the plots to Excel so that I can customize my plot title/legend/caption text… 

There's [`ggtext`](https://wilkelab.org/ggtext/)! It allows you to customize text font and color in ggplots using html syntex. Here's the [talk](https://resources.rstudio.com/rstudio-conf-2020/spruce-up-your-ggplot2-visualizations-with-formatted-text-claus-wilke) and an example from the author: 

![ggtext example](https://wilkelab.org/ggtext/reference/figures/README-unnamed-chunk-4-1.png)

The package is still in active development so [vote](https://github.com/wilkelab/ggtext/issues) for the your most-wanted features and keep on eye for new updates!






