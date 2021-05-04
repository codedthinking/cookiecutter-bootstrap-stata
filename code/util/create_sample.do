clear
set obs 10000
generate x = invnormal(uniform())
save "data/input/sample.dta", replace
