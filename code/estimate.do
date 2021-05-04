/*
This code reads the data, runs the estimation and saves the statistics. You can do anything between the first and the last step.

The command-line parameter `1' is the input file name, the parameters `2' is the output file name.
Use fully qualified names, including the .dta extension.
*/
args input_file output_file
confirm existence `input_file'
confirm existence `output_file'
use "`input_file'", clear

/* estimation code comes here */
summarize x
scalar theta = r(mean)
clear
set obs 1
generate theta = theta

save "`output_file'", replace