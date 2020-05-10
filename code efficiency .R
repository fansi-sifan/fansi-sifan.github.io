# make sure R version is up to date
version
# check for time 
system.time(df <- seq(1,1e8))

microbenchmark::microbenchmark(
  seq(1,1e8),
  seq(1,1e8, by = 1),
  times = 10
)

# test machine
# res <- benchmarkme::benchmark_std(runs = 3)
# plot(res)


# memory allocation: never grow a factor
benchmarkme::get_cpu()
benchmarkme::get_ram()
# use a vectorized output whenever possible
sum(log(1:10))

# use a matrix whenever appropriate (require same data type)

# find bottleneck
profvis::profvis({
  # functions inside
})

# parallel