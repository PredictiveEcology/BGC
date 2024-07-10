defineModule(sim, list(
  name = "BGC",
  description = "Run Biome BGC from R",
  keywords = "",
  authors = c(
    person(c("Alex", "M"), "Chubaty", email = "achubaty@for-cast.ca", role = c("aut", "cre")),
    person("Celine", "Boisvenue", email = "celine.boisvenue@nrcan-rncan.gc.ca", role = c("aut"))
  ),
  childModules = character(0),
  version = list(SpaDES.core = "2.1.5.9001", BGC = "0.0.0.9000"),
  timeframe = as.POSIXlt(c(NA, NA)),
  timeunit = "year",
  citation = list("citation.bib"),
  documentation = deparse(list("README.md", "BGC.Rmd")), ## same file
  reqdPkgs = list("ggplot2",
                  "PredictiveEcology/BiomeBGCR@development",
                  "PredictiveEcology/reproducible@development (>= 2.1.1.9002)"),
  parameters = rbind(
    defineParameter("annual_outLength", "integer", 6L, NA, NA,
                    desc = "number of output variables selected for annual reporting"),
    defineParameter("annual_output", "integer", integer(6L), NA, NA,
                    desc = paste("The index number for the first requested daily output variable.",
                                 "There are more than 500 possible output variables.",
                                 "The index value for each variable is defined in the file `output_map_init.c`",
                                 "The variables requested in this section are reported once each year (yearday 365).")),
    defineParameter("daily_outLength", "integer", 3L, NA, NA,
                    desc = "number of output variables selected for daily reporting"),
    defineParameter("daily_output", "integer", integer(3L), NA, NA,
                    desc = paste("The index number for the first requested daily output variable.",
                                 "There are more than 500 possible output variables.",
                                 "The index value for each variable is defined in the file `output_map_init.c`.",
                                 "The variables requested in this section are reported daily.")),
    defineParameter("epc_file", "character", NA, NA, NA,
                    desc = "Path to the ecophysiological constants file"),
    defineParameter("met_header", "integer",  NA, NA, NA,
                    desc = "number of line of heading in the met file"),
    defineParameter("met_input", "character", NA, NA, NA,
                    desc = "Where to fin the meteorological data"),
    defineParameter("restart_flag", "integer", c(1L, 0L, 1L), NA, NA,
                    desc = paste(
                      "1) flag (1 or 0) for reading (1) or not reading (0) a restart file from the end of a previous simulation,",
                      "2) flag (1 or 0) for writing (1) or not writing (0) a restart file at the end of this simulation,",
                      "3) flag (1 or 0) for met year from restart file (1) or met year reset to beginningof record (0).")),
    defineParameter("restart_inputFile", "character", NA, NA, NA,
                    desc = "Where to find the restart file in a 'go' mode run"),
    defineParameter("restart_outputFile", "character", NA, NA, NA,
                    desc = "Where to store the spinup output file in spinup mode"),
    defineParameter("outputPrefix", "character", "rBgc", NA, NA,
                    desc = "text string giving the prefix for all output files"),
    defineParameter("output_control", "integer", c(1L, 0L, 0L, 0L, 1L), NA, NA,
                    desc = paste(
                      "- flag (1 or 0) to write (1) or not write (0) a binary output file with daily values;",
                      "- flag (1 or 0) to write (1) or not write (0) a binary output file with monthly averages of the daily variables",
                      "- flag (1 or 0) to write (1) or not write (0) a binary output file with annual averages of the daily variables",
                      "- flag (1 or 0) to write (1) or not write (0) a binary output file with year-end values",
                      "- flag (1 or 0) to send (1) or not send (0) simultation progress information to the screen")),
    #defineParameter("paramName", "paramClass", value, min, max, "parameter description"),
    defineParameter(".plots", "character", "screen", NA, NA,
                    "Used by Plots function, which can be optionally used here"),
    defineParameter(".plotInitialTime", "numeric", start(sim), NA, NA,
                    "Describes the simulation time at which the first plot event should occur."),
    defineParameter(".plotInterval", "numeric", NA, NA, NA,
                    "Describes the simulation time interval between plot events."),
    defineParameter(".saveInitialTime", "numeric", NA, NA, NA,
                    "Describes the simulation time at which the first save event should occur."),
    defineParameter(".saveInterval", "numeric", NA, NA, NA,
                    "This describes the simulation time interval between save events."),
    ## .seed is optional: `list('init' = 123)` will `set.seed(123)` for the `init` event only.
    defineParameter(".seed", "list", list(), NA, NA,
                    "Named list of seeds to use for each event (names)."),
    defineParameter(".useCache", "logical", FALSE, NA, NA,
                    "Should caching of events or module be used?")
  ),
  inputObjects = bindrows(
    expectsInput("studyArea", "sf", desc = NA, sourceURL = NA)
  ),
  outputObjects = bindrows(
    #createsOutput("objectName", "objectClass", "output object description", ...),
    createsOutput("bgc.ini", "dataset",
                  desc = "Default parameters for Biome-BGCR run")
  )
))

## event types
#   - type `init` is required for initialization

doEvent.BGC = function(sim, eventTime, eventType) {
  switch(
    eventType,
    init = {
      ### check for more detailed object dependencies:
      ### (use `checkObject` or similar)

      # do stuff for this event
      sim <- Init(sim)

      # schedule future event(s)
      sim <- scheduleEvent(sim, P(sim)$.plotInitialTime, "BGC", "plot")
      sim <- scheduleEvent(sim, P(sim)$.saveInitialTime, "BGC", "save")
    },
    plot = {
      # ! ----- EDIT BELOW ----- ! #
      # do stuff for this event

      plotFun(sim) # example of a plotting function
      # schedule future event(s)

      # e.g.,
      #sim <- scheduleEvent(sim, time(sim) + P(sim)$.plotInterval, "BGC", "plot")

      # ! ----- STOP EDITING ----- ! #
    },
    save = {
      # ! ----- EDIT BELOW ----- ! #
      # do stuff for this event

      # e.g., call your custom functions/methods here
      # you can define your own methods below this `doEvent` function

      # schedule future event(s)

      # e.g.,
      # sim <- scheduleEvent(sim, time(sim) + P(sim)$.saveInterval, "BGC", "save")

      # ! ----- STOP EDITING ----- ! #
    },
    event1 = {
      # ! ----- EDIT BELOW ----- ! #
      # do stuff for this event

      # e.g., call your custom functions/methods here
      # you can define your own methods below this `doEvent` function

      # schedule future event(s)

      # e.g.,
      # sim <- scheduleEvent(sim, time(sim) + increment, "BGC", "templateEvent")

      # ! ----- STOP EDITING ----- ! #
    },
    event2 = {
      # ! ----- EDIT BELOW ----- ! #
      # do stuff for this event

      # e.g., call your custom functions/methods here
      # you can define your own methods below this `doEvent` function

      # schedule future event(s)

      # e.g.,
      # sim <- scheduleEvent(sim, time(sim) + increment, "BGC", "templateEvent")

      # ! ----- STOP EDITING ----- ! #
    },
    warning(paste("Undefined event type: \'", current(sim)[1, "eventType", with = FALSE],
                  "\' in module \'", current(sim)[1, "moduleName", with = FALSE], "\'", sep = ""))
  )
  return(invisible(sim))
}

## event functions
#   - keep event functions short and clean, modularize by calling subroutines from section below.

### template initialization
Init <- function(sim) {
  # # ! ----- EDIT BELOW ----- ! #
  browser()
  sim$bgc.ini <- new("dataset",
                     # part of the TIME_DEFINE block of the .ini file
                     max_spinup = 6000,
                     # CLIM_CHANGE block of the .ini
                     clim_change = c(0.0, 0.0, 1.0, 1.0),
                     # CO2_CONTROL block in the .ini
                     # 1) flag (0,1,2) controlling CO2 concentration: 0=constant, 1=varying using
                     # values from a special file, 2=constant, but use the CO2 values in the
                     # specified file to control levels of N deposition (see below for N deposition
                     # options).
                     # 2) the value to use for constant CO2 concentration (ppm)
                     co2_control = c(0, 425),
                     co2_file = file.path(inputDir, "co2", "nameOfFile"),
                     # matches the SITE block in the .ini file
                     # 1) rooting zone soil depth, after accounting for the fraction of the rooting
                     # zone occupied by rocks
                     # 2) soil texture: percent sand (by volume in rock-free soil)
                     # 3) soil texture: percent silt (by volume in rock-free soil)
                     # 4) soil texture: percent clay (by volume in rock-free soil)
                     # 5) site elevation in meters above mean sea level
                     # 6) site latitude in decimal degrees (negative values for southern hemisphere)
                     # 7) site shortwave albedo
                     # 8) annual rate of atmospheric nitrogen deposition (wet + dry deposition)
                     # 9) annual rate of symbiotic + asymbiotic nitrogen fixation
                     site = c(1.0, 30.0, 50.0, 20.0, 977.0, 46.8, 0.2, 0.0001, 0.008),
                     # matches the RAMP_NDEP block of the .inin
                     # 1) flag (1 or 0) for variable nitrogen deposition (1) or constant nitrogen
                     # depostition (0)
                     # 2) the reference year for industrial nitrogen deposition value
                     # 3) the reference value for industrial nitrogen deposition
                     ramp_ndep = c(0, 2099, 0.0001),
                     # matches the W_STATE block in the .ini file
                     # 1) initial snowpack water content (start of simulation)
                     # 2) initial soil water content as a proportion of saturation
                     w_state = c(0.0, 0.5),
                     # C_STATE block in the .ini file
                     # 1) peak leaf carbon to be attained during the first simulation year
                     # 2) peak stem carbon to be attained during the first year
                     # 3) initial coarse woody debris carbon (dead trees, standing or fallen)
                     # 4) initial litter carbon, labile pool
                     # 5) initial litter carbon, unshielded cellulose pool
                     # 6) initial litter carbon, shielded cellulose pool
                     # 7) initial litter carbon, lignin pool
                     # 8) soil carbon, fast pool
                     # 9) soil carbon, medium pool
                     # 10) soil carbon, slow pool
                     # 11) soil carbon, slowest pool
                     c_state = c(0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
                     # N_STATE block of.ini file
                     # 1) litter nitrogen associated with labile litter carbon pool
                     # 2) soil mineral nitrogen pool
                     n_state = c(0.0, 0.0)
  )

  ## TODO: assertion to check if annual process proportional matrices all have a summed value of 1 per row.

  ## TODO: read in meteorological data (.mtc43) files
  #sim$bgc.mtc43 <- blah

  ## TODO: read in ecophysiological constants
  #sim$bgc.epc <- fread("C:/Celine/github/BiomeBGCR/inputs/epc/bgc_epc_enf.csv")
  #setnames(sim$bgc.epc, names(sim$bgc.epc), c("value", "units", "desc"))

  # ! ----- STOP EDITING ----- ! #

  return(invisible(sim))
}

### template for save events
Save <- function(sim) {
  # ! ----- EDIT BELOW ----- ! #
  # do stuff for this event
  sim <- saveFiles(sim)

  # ! ----- STOP EDITING ----- ! #
  return(invisible(sim))
}

### template for plot events
plotFun <- function(sim) {
  # ! ----- EDIT BELOW ----- ! #
  # do stuff for this event
  sampleData <- data.frame("TheSample" = sample(1:10, replace = TRUE))
  Plots(sampleData, fn = ggplotFn)

  # ! ----- STOP EDITING ----- ! #
  return(invisible(sim))
}

### template for your event1
Event1 <- function(sim) {
  # ! ----- EDIT BELOW ----- ! #
  # THE NEXT TWO LINES ARE FOR DUMMY UNIT TESTS; CHANGE OR DELETE THEM.
  # sim$event1Test1 <- " this is test for event 1. " # for dummy unit test
  # sim$event1Test2 <- 999 # for dummy unit test

  # ! ----- STOP EDITING ----- ! #
  return(invisible(sim))
}

### template for your event2
Event2 <- function(sim) {
  # ! ----- EDIT BELOW ----- ! #
  # THE NEXT TWO LINES ARE FOR DUMMY UNIT TESTS; CHANGE OR DELETE THEM.
  # sim$event2Test1 <- " this is test for event 2. " # for dummy unit test
  # sim$event2Test2 <- 777  # for dummy unit test

  # ! ----- STOP EDITING ----- ! #
  return(invisible(sim))
}

.inputObjects <- function(sim) {
  #cacheTags <- c(currentModule(sim), "function:.inputObjects") ## uncomment this if Cache is being used
  dPath <- asPath(getOption("reproducible.destinationPath", dataPath(sim)), 1)
  message(currentModule(sim), ": using dataPath '", dPath, "'.")

  # ! ----- EDIT BELOW ----- ! #

  mod$targetCRS <- paste("+proj=lcc +lat_1=49 +lat_2=77 +lat_0=0 +lon_0=-95",
                         "+x_0=0 +y_0=0 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0") ## NRCAN LCC

  if (st_crs(sim$studyArea) != st_crs(mod$targetCRS)) {
    sim$studyArea <- st_transform(sim$studyArea, mod$targetCRS)
  }

  # ! ----- STOP EDITING ----- ! #
  return(invisible(sim))
}

ggplotFn <- function(data, ...) {
  ggplot(data, aes(TheSample)) +
    geom_histogram(...)
}

### add additional events as needed by copy/pasting from above
