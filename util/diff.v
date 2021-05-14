import structs

pub fn compare_product_caches(new_products []structs.MobileStockProduct, old_products []structs.MobileStockProduct) ? {
	mut restocked_products := []structs.MobileStockProduct{}

	for new_product in new_products {
		existing := find_product_in_arr(new_product.id, old_products) or {
			// If it doesn't exist, we can automatically assume it's "new" and add to arr
			restocked_products << new_product
			break
		}
	}
}

fn find_product_in_arr(id int, products []structs.MobileStockProduct) ?structs.MobileStockProduct {
	for product in products {
		if product.id == id {
			return product
		}
	}

	return error('Product $id not found')
}
