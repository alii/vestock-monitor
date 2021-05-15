module structs

pub struct MobileStockProduct {
pub:
	name            string
	id              int
	image_url       string
	image_url_hi    string
	price           i8
	sale_price      i8
	new_item        bool
	position        i8
	category_name   string
	price_euro      i8
	sale_price_euro i8
}

pub struct MobileStock {
pub:
	products_and_categories ProductAndCategories
	release_date            string
	release_week            string
}

pub struct ProductAndCategories {
pub:
	skate         []MobileStockProduct [json: 'Skate']
	accessories   []MobileStockProduct [json: 'Accessories']
	bags          []MobileStockProduct [json: 'Bags']
	pants         []MobileStockProduct [json: 'Pants']
	hats          []MobileStockProduct [json: 'Hats']
	tops_sweaters []MobileStockProduct [json: 'Tops/Sweaters']
	jackets       []MobileStockProduct [json: 'Jackets']
	sweatshirts   []MobileStockProduct [json: 'Sweatshirts']
	shorts        []MobileStockProduct [json: 'Shorts']
	shirts        []MobileStockProduct [json: 'Shirts']
	new_products  []MobileStockProduct [json: 'new']
}

// See: https://discord.com/channels/592103645835821068/592114487759470596/843154776153915482
//      discord.gg/vlang
pub fn pc_field_values(pc ProductAndCategories) []MobileStockProduct {
	mut res := []MobileStockProduct{}
	$for f in ProductAndCategories.fields {
		$if f.typ is []MobileStockProduct {
			res << pc.$(f.name)
		}
	}
	return res
}
