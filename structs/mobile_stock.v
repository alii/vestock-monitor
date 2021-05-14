module structs

pub struct MobileStockProduct {
pub:
	name            string
	id              i8
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
	new           []MobileStockProduct [json: 'new']
}
