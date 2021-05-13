module structs

pub struct Product {
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
	skate         []Product [json: 'Skate']
	accessories   []Product [json: 'Accessories']
	bags          []Product [json: 'Bags']
	pants         []Product [json: 'Pants']
	hats          []Product [json: 'Hats']
	tops_sweaters []Product [json: 'Tops/Sweaters']
	jackets       []Product [json: 'Jackets']
	sweatshirts   []Product [json: 'Sweatshirts']
	shorts        []Product [json: 'Shorts']
	shirts        []Product [json: 'Shirts']
	new           []Product [json: 'new']
}
