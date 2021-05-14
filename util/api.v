module util

import structs
import net.http
import json

const (
	// base_endpoint = 'https://www.supremenewyork.com'
	base_endpoint = 'http://localhost:8080'

	http_config   = http.FetchConfig{
		user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36'
	}
)

fn get_mobile_stock() ?structs.MobileStock {
	url := '$util.base_endpoint/mobile_stock.json'
	request := http.fetch(url, util.http_config) ?
	return json.decode(structs.MobileStock, request.text) or {}
}

pub fn get_product(id int) ?structs.ProductRoot {
	url := '$util.base_endpoint/shop/${id}.json'
	request := http.fetch(url, util.http_config) ?
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
