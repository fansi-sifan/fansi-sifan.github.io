---
title: How Rstudio::Conf 2020 has changed my (R programming) life
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

This year I had the opportunity to attend the [RStudio::Conf](https://rstudio.com/conference/) as one of the [Diversity Scholarship recipients](https://blog.rstudio.com/2019/08/30/diversity-scholarships/), and as way of giving back, I'm going to blog about what I learned! 

Like most of the R users, I'm largely self-taught with weird gaps in my knowledge of R, therefore I constantly have internal monologue like these ones: 

> copy+paste+google is the only way to debug my R code because the Error message doesn't make any sense

>	`.Rprofile` ? `.Renviron`? Um, these dotfiles seem weird, I  better not mess up with these.

> Only R developers write packages so that has nothing to do with me. 

Furthermore, the open source nature of R language also makes it hard to catch up with all the latest updates and trends that are most relevent:

> I wish there was a `tidyverse` for machine learning… (wait, there's `tidymodels`!)

> `ggplot2` is great, but let me copy the plots to Excel so that I can customize my plot title/legend/caption text… (wait, there's `ggtext`!)

If you share similar thoughts, here are the Rstudio::conf 2020 workshops/talks that you should check out, as well as my takeaways on how to catch up with all the latest trends in R, and become a lifelong R learner. 

## Rstudio::conf 2020 Highlights

### Error message doesn't make any sense so copy+paste+google is the only way to debug my R code. 
Let's admit it, debugging from a mysterious error message is hard. So my first reaction is always copy the entire error message and google it, and hoping someone has already figured it out somewhere on the web.  

Jenny's awesome keynote walk through "four stages of debugging": 
1. Reset: Restart R session - it seems that the wisdom of turning things off and on applies to everything. 

2. **REPR**oducible **EX**ample: Try narrow down the problem by creating a **minimal** **REPR**oducible **EX**ample, using only what is needed to see the problem. Bonus: there's even a [`REPREX`](https://github.com/tidyverse/reprex#readme) package that makes it easier to prepare your R code for posting on StackOverflow/GitHub/Slack when asking for help!

3. Debug:use `traceback()`, `browser()`, and `debug()`, R's built-in functions that help you to diagnose what went wrong. Read more about the detailed strategies here in this [Debugging](https://rstats.wtf/debugging-r-code.html) chapter. 

4. Deter: write test and assertations into functions to plan for the unexpected. The [`testthat`](https://testthat.r-lib.org/) package is built specifically for this purpose. 



### `.Rprofile` ? `.Renviron`? Um, these dotfiles seem weird, I better not mess up with them…"

What they forgot to teach you about R

Actually, these are files that help you to customize your R sessions. `.Renviron` is most useful for storing sensitive information such as your cnesus API keys, or GitHub PAT. `.Rprofile` contains R code you want to run at every R start up. Here's what I decided to include in my `.Rprofile` for now!

```
# 1. loading packages that are useful for workflow
# note that you should not load packages that used in actual analysis like tidyverse because that would be reproducibile.
  library(usethis)
  library(devtools)
  
# 2. make all warnings errors for robost coding habit
  options(warn = 2)
  
# 3. Get a fortune cookie!
  if (interactive()) # sessions you are controlling with a terminal
    { # (requires fortunes package)
      fortunes::fortune()
    }
```

Again, Jenny has a great chapter here explaining these two files on [R startup](https://rstats.wtf/r-startup.html)



###  Only R developers write packages so that has nothing to do with me. 

Surprise! R packages are useful even if you never share your code! In Hadley's word, 
> Organising code in a package makes your life easier because packages come with conventions

You can also create your personal package 

Karla's 

###  I wish there was a `tidyverse` for machine learning…

Well, actually there is! It's [tidymodels](https://www.tidyverse.org/blog/2018/08/tidymodels-0-0-1/). It contains everything from defining [recipes](https://tidymodels.github.io/recipes/) to encode and preprocess different datasets, to help [tune](https://tidymodels.github.io/tune/articles/getting_started.html) parameters for your model. 

###  `ggplot2` is great, but let me copy the plots to Excel so that I can customize my plot title/legend/caption text…

`ggtext`



Okay, great, I've learned all these great stuffs at the conference, but now what? 

## Resources

1. RStudio resource

If you don't know this already, RStudio maintains an awesome [resources](https://resources.rstudio.com/) page with free webinars, videos, and books that cover everything you need from a beginner to an advanced user. All workshop materials are also posted in this [GitHub](https://github.com/rstudio-conf-2020)

2. Screen cast

Learning from the masters! 
- [David Robinson](https://www.youtube.com/channel/UCeiiqmVK07qhY-wvg3IZiZQ)
- [Hadley Wickman](https://www.youtube.com/channel/UCxOhDvtaoXDAB336AolWs3A)
- [Julia Silge](https://www.youtube.com/channel/UCTTBgWyJl2HrrhQOOc710kA)

3. Tweets!

Follow those who are tweeting about [#rstats](https://twitter.com/search?q=%23rstats)!

## Practice
1. Tidy Tuesday
2. Ryan T Fun projects

