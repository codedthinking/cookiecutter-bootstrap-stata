args seed
set seed `seed'

use "data/input/sample.dta", clear
bsample
save "data/sample/`seed'.dta", replace