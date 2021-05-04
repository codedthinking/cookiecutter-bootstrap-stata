clear all
local flist : dir "result/sample" files "*.dta"
tempfile aggregate
save "`aggregate'", replace emptyok

foreach f in `flist' {
    use "result/sample/`f'", clear
    append using "`aggregate'"
    save "`aggregate'", replace
}

collapse (mean) mean_theta = theta (sd) se_theta = theta
export delimited "result/theta.csv", replace