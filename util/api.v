module util

import structs
import net.http
import json

const (
	base_endpoint = 'https://www.supremenewyork.com'
)

fn get_mobile_stock() ?structs.MobileStock {
	request := http.get(util.base_endpoint + '/mobile_stock.json') ?
	return json.decode(structs.MobileStock, request.text) or {}
}

pub fn get_all_products() ?[]structs.Product {
	stock := get_mobile_stock() ?

	return stock.products_and_categories.tops_sweaters

	// mut all_products := []structs.Product{}

	// $for field in ProductAndCategories.fields {
	// 	all_products << stock.products_and_categories.$(field.name)
	// }

	// return all_products
}
