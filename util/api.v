module util

import structs
import net.http
import json

const (
	base_endpoint = 'https://www.supremenewyork.com'
)

fn get_mobile_stock() ?structs.MobileStock {
	url := '$util.base_endpoint/mobile_stock.json'
	request := http.get(url) ?
	return json.decode(structs.MobileStock, request.text) or {}
}

pub fn get_product(id int) ?structs.ProductRoot {
	url := '$util.base_endpoint/shop/${id}.json'
	request := http.get(url) ?
	return json.decode(structs.ProductRoot, request.text) or {}
}

pub fn get_all_products() ?[]structs.MobileStockProduct {
	stock := get_mobile_stock() ?

	return stock.products_and_categories.tops_sweaters

	// mut all_products := []structs.MobileStockProduct{}

	// $for field in ProductAndCategories.fields {
	// 	all_products << stock.products_and_categories.$(field.name)
	// }

	// return all_products
}
