module util

import structs

pub fn compare_product_caches(new_products []structs.MobileStockProduct, old_products []structs.MobileStockProduct) []structs.MobileStockProduct {
	mut restocked_products := []structs.MobileStockProduct{}

	for new_product in new_products {
		is_new := !product_exists_in_arr(new_product.id, old_products)

		if is_new {
			restocked_products << new_product
			continue
		}
	} 

	return restocked_products
}

fn product_exists_in_arr(id int, products []structs.MobileStockProduct) bool {
	for product in products {
		if product.id == id {
			return true
		}
	}

	return false
}
