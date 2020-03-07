json.id                variant.id
json.product_id        variant.product_id
json.sku               variant.sku
json.sku_option_values variant.sku_option_values
json.text_sku_values   variant.text_sku_values
json.price             Shop::FirstDiscountsPrice.call(variant.product, @current_user, variant.price)
json.original_price    variant.original_price
json.weight            variant.weight
json.volume            variant.volume
json.stock             variant.stock
json.origin_point      variant.origin_point
json.image             variant.image&.preview || variant.product.preview_icon