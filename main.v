import util
import time
import term

const (
	// The frequency in seconds to request product at
	freq = 5
)

println(term.yellow('Initializing product cache'))

mut product_cache := util.get_all_products() ?
// mut iteration := 0

println(term.green('Initialized product cache'))

product := product_cache[0]
println(product)

println(util.get_product(product.id))

// for {
// 	time.sleep(freq * 1000 * time.millisecond)
// 	iteration++

// 	println(term.yellow('Requesting products [i: $iteration]'))
// }

// println(product_cache)
