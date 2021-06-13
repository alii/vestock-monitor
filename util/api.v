module util

import structs
import net.http
import json

type ProductAndCategories = structs.ProductAndCategories

const (
	base_endpoint = 'https://www.supremenewyork.com'

	http_config = http.FetchConfig{
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
	return structs.pc_field_values(stock.products_and_categories)
}
