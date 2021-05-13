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

	all_products := []structs.Product{}

	for _, category_products in stock.products_and_categories {
		all_products << category_products
	}

	return stock.products_and_categories.jackets
}
