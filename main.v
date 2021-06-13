import util
import time
import term
import zztkm.vdotenv

const (
	// The frequency in seconds to request product at
	freq = 5
)

vdotenv.load()
println(term.yellow('Initializing product cache'))

mut product_cache := util.get_all_products() ?
mut iteration := 0

println(term.green('Initialized product cache'))

for {
	time.sleep(freq * 1000 * time.millisecond)
	iteration++

	println(term.yellow('Requesting products [i: $iteration]'))

	products := util.get_all_products() ?

	if products.len == 0 {
		continue
	}

	go util.send_webhook(util.compare_product_caches(products, product_cache))

	product_cache = products.clone()
}

println(product_cache)
