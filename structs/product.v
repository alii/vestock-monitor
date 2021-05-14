module structs

pub struct ProductRoot {
pub:
	styles                      []Style
	description                 string
	can_add_styles              bool
	can_buy_multiple            bool
	ino                         string
	cod_blocked                 bool
	canada_blocked              bool
	purchasable_qty             i8
	new_item                    bool
	apparel                     bool
	handling                    i16
	no_free_shipping            bool
	can_buy_multiple_with_limit i8
	non_eu_blocked              bool
	russia_blocked              bool
}

pub struct Style {
	id                   i8
	name                 string
	currency             string
	image_url            string
	image_url_hi         string
	swatch_url           string
	swatch_url_hi        string
	mobile_zoomed_url    string
	mobile_zoomed_url_hi string
	bigger_zoomed_url    string
	sizes                []Size
}

pub struct Size {
pub:
	name        string
	id          i8
	stock_level int
}
