import vweb
import os

struct App {
	vweb.Context
	mobile_stock string = os.read_file('./mobile_stock.json') or { panic(err.msg) }
	product      string = os.read_file('./product.json') or { panic(err.msg) }
}

['/mobile_stock.json']
fn (mut app App) mobile_stock() vweb.Result {
	return app.json(app.mobile_stock)
}

['/shop/:id']
fn (mut app App) shop_product(id string) vweb.Result {
	return app.json(app.product)
}

vweb.run(App{}, 8080)
