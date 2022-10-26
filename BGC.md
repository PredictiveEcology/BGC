---
title: "BGC"
author: "achubaty"
date: "03 December 2021"
output:
  html_document:
    keep_md: yes
editor_options:
  chunk_output_type: console
---



# Overview

Provide an overview of what the module does / how to use the module.

Module documentation should be written so that others can use your module.
This is a template for module documentation, and should be changed to reflect your module.

## R Markdown

R Markdown syntax allows R code, outputs, and figures to be rendered in the documentation.

For help writing in R Markdown, see https://rmarkdown.rstudio.com/.

# Usage


```r
library(SpaDES.core)
```


```r
setPaths(modulePath = file.path(".."))
getPaths() # shows where the 4 relevant paths are

times <- list(start = 0, end = 10)

parameters <- list(
  #.progress = list(type = "text", interval = 1), # for a progress bar
  ## If there are further modules, each can have its own set of parameters:
  #module1 = list(param1 = value1, param2 = value2),
  #module2 = list(param1 = value1, param2 = value2)
)
modules <- list("BGC")
objects <- list()
inputs <- list()
outputs <- list()

mySim <- simInit(times = times, params = parameters, modules = modules,
                 objects = objects)

mySimOut <- spades(mySim)
```

# Parameters

Provide a summary of user-visible parameters.


```
## defineParameter: '.plotInitialTime' is not of specified type 'numeric'.
```



|paramName        |paramClass |default    |min |max |paramDesc                                                                 |
|:----------------|:----------|:----------|:---|:---|:-------------------------------------------------------------------------|
|.plots           |character  |screen     |NA  |NA  |Used by Plots function, which can be optionally used here                 |
|.plotInitialTime |numeric    |start(sim) |NA  |NA  |Describes the simulation time at which the first plot event should occur. |
|.plotInterval    |numeric    |NA         |NA  |NA  |Describes the simulation time interval between plot events.               |
|.saveInitialTime |numeric    |NA         |NA  |NA  |Describes the simulation time at which the first save event should occur. |
|.saveInterval    |numeric    |NA         |NA  |NA  |This describes the simulation time interval between save events.          |
|.seed            |list       |           |NA  |NA  |Named list of seeds to use for each event (names).                        |
|.useCache        |logical    |FALSE      |NA  |NA  |Should caching of events or module be used?                               |

# Events

Describe what happens for each event type.

## Plotting

Write what is plotted.

## Saving

Write what is saved.

# Data dependencies

## Input data

How to obtain input data, and a description of the data required by the module.
If `sourceURL` is specified, `downloadData("BGC", "..")` may be sufficient.


```
## defineParameter: '.plotInitialTime' is not of specified type 'numeric'.
```



|objectName |objectClass |desc |sourceURL |
|:----------|:-----------|:----|:---------|
|NA         |NA          |NA   |NA        |

## Output data

Description of the module outputs.


```
## defineParameter: '.plotInitialTime' is not of specified type 'numeric'.
```



|objectName |objectClass |desc |
|:----------|:-----------|:----|
|NA         |NA          |NA   |

# Links to other modules

Describe any anticipated linkages to other modules.
