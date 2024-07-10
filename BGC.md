---
title: "BGC Manual"
subtitle: "v.0.0.0.9000"
date: "Last updated: 2024-07-09"
output:
  bookdown::html_document2:
    toc: true
    toc_float: true
    theme: sandstone
    number_sections: false
    df_print: paged
    keep_md: yes
editor_options:
  chunk_output_type: console
  bibliography: citations/references_BGC.bib
link-citations: true
always_allow_html: true
---

# BGC Module

<!-- the following are text references used in captions for LaTeX compatibility -->
(ref:BGC) *BGC*



<!-- if knitting to pdf remember to add the pandoc_args: ["--extract-media", "."] option to yml in order to get the badge images -->

#### Authors:

Alex M Chubaty <achubaty@for-cast.ca> [aut, cre], Celine Boisvenue <celine.boisvenue@nrcan-rncan.gc.ca> [aut]
<!-- ideally separate authors with new lines, '\n' not working -->

## Module Overview

### Module summary

Provide a brief summary of what the module does / how to use the module.

Module documentation should be written so that others can use your module.
This is a template for module documentation, and should be changed to reflect your module.

### Module inputs and parameters

sufficient.
Table \@ref(tab:moduleInputs-BGC) shows the full list of module inputs.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleInputs-BGC)(\#tab:moduleInputs-BGC)List of (ref:BGC) input objects and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> objectName </th>
   <th style="text-align:left;"> objectClass </th>
   <th style="text-align:left;"> desc </th>
   <th style="text-align:left;"> sourceURL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> studyArea </td>
   <td style="text-align:left;"> sf </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
</tbody>
</table>

Table \@ref(tab:moduleParams-BGC) shows the full list of module parameters.

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleParams-BGC)(\#tab:moduleParams-BGC)List of (ref:BGC) parameters and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> paramName </th>
   <th style="text-align:left;"> paramClass </th>
   <th style="text-align:left;"> default </th>
   <th style="text-align:left;"> min </th>
   <th style="text-align:left;"> max </th>
   <th style="text-align:left;"> paramDesc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> annual_outLength </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> number of output variables selected for annual reporting </td>
  </tr>
  <tr>
   <td style="text-align:left;"> annual_output </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 0, 0, 0,.... </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> The index number for the first requested daily output variable. There are more than 500 possible output variables. The index value for each variable is defined in the file `output_map_init.c` The variables requested in this section are reported once each year (yearday 365). </td>
  </tr>
  <tr>
   <td style="text-align:left;"> daily_outLength </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> number of output variables selected for daily reporting </td>
  </tr>
  <tr>
   <td style="text-align:left;"> daily_output </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 0, 0, 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> The index number for the first requested daily output variable. There are more than 500 possible output variables. The index value for each variable is defined in the file `output_map_init.c`. The variables requested in this section are reported daily. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> epc_file </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Path to the ecophysiological constants file </td>
  </tr>
  <tr>
   <td style="text-align:left;"> met_header </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> number of line of heading in the met file </td>
  </tr>
  <tr>
   <td style="text-align:left;"> met_input </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Where to fin the meteorological data </td>
  </tr>
  <tr>
   <td style="text-align:left;"> restart_flag </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 1, 0, 1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 1) flag (1 or 0) for reading (1) or not reading (0) a restart file from the end of a previous simulation, 2) flag (1 or 0) for writing (1) or not writing (0) a restart file at the end of this simulation, 3) flag (1 or 0) for met year from restart file (1) or met year reset to beginningof record (0). </td>
  </tr>
  <tr>
   <td style="text-align:left;"> restart_inputFile </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Where to find the restart file in a 'go' mode run </td>
  </tr>
  <tr>
   <td style="text-align:left;"> restart_outputFile </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Where to store the spinup output file in spinup mode </td>
  </tr>
  <tr>
   <td style="text-align:left;"> outputPrefix </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> rBgc </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> text string giving the prefix for all output files </td>
  </tr>
  <tr>
   <td style="text-align:left;"> output_control </td>
   <td style="text-align:left;"> integer </td>
   <td style="text-align:left;"> 1, 0, 0,.... </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> - flag (1 or 0) to write (1) or not write (0) a binary output file with daily values; - flag (1 or 0) to write (1) or not write (0) a binary output file with monthly averages of the daily variables - flag (1 or 0) to write (1) or not write (0) a binary output file with annual averages of the daily variables - flag (1 or 0) to write (1) or not write (0) a binary output file with year-end values - flag (1 or 0) to send (1) or not send (0) simultation progress information to the screen </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .plots </td>
   <td style="text-align:left;"> character </td>
   <td style="text-align:left;"> screen </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Used by Plots function, which can be optionally used here </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .plotInitialTime </td>
   <td style="text-align:left;"> numeric </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Describes the simulation time at which the first plot event should occur. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .plotInterval </td>
   <td style="text-align:left;"> numeric </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Describes the simulation time interval between plot events. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .saveInitialTime </td>
   <td style="text-align:left;"> numeric </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Describes the simulation time at which the first save event should occur. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .saveInterval </td>
   <td style="text-align:left;"> numeric </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> This describes the simulation time interval between save events. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .seed </td>
   <td style="text-align:left;"> list </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Named list of seeds to use for each event (names). </td>
  </tr>
  <tr>
   <td style="text-align:left;"> .useCache </td>
   <td style="text-align:left;"> logical </td>
   <td style="text-align:left;"> FALSE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> Should caching of events or module be used? </td>
  </tr>
</tbody>
</table>

### Events

Describe what happens for each event type.

### Plotting

Write what is plotted.

### Saving

Write what is saved.

### Module outputs

Description of the module outputs (Table \@ref(tab:moduleOutputs-BGC)).

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>(\#tab:moduleOutputs-BGC)(\#tab:moduleOutputs-BGC)List of (ref:BGC) outputs and their description.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> objectName </th>
   <th style="text-align:left;"> objectClass </th>
   <th style="text-align:left;"> desc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> bgc.ini </td>
   <td style="text-align:left;"> dataset </td>
   <td style="text-align:left;"> Default parameters for Biome-BGCR run </td>
  </tr>
</tbody>
</table>

### Links to other modules

Describe any anticipated linkages to other modules, such as modules that supply input data or do post-hoc analysis.

### Getting help

- <https://github.com/PredictiveEcology/BGC/issues>
