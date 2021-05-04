SEEDS := 5307  5561  2514  9241  7529  1821  4113  7360  9596  1736  7318  8204  3877  8045  7542  5177  7758  5310  8502  1021  6330  3855  8339  1795  6557  5446  7158  5215  7109  4595  6988  9602  9760  1758  4056  7268  7849  9396  4678  7601  9878  4652  4382  4333  9032  1763  7774  1150  8575  3949

result/theta.csv: code/util/aggregate.do $(foreach seed,$(SEEDS),result/sample/$(seed).dta) 
	stata -b do $<
result/sample/%.dta: data/sample/%.dta code/estimate.do
	stata -b do code/estimate.do $< $@
data/sample/%.dta: code/util/select_sample.do data/input/sample.dta
	stata -b do $< $*
data/input/sample.dta: code/util/create_sample.do
	stata -b do $<
result/actual.dta: data/input/sample.dta code/estimate.do
	stata -b do code/estimate.do $< $@

.PRECIOUS: data/sample/%.dta