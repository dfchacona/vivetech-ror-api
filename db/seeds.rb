# Clean DB
Product.destroy_all
Variant.destroy_all

# Add records
product_list = [
  [ "Zapatos", "Prenda para los pies" ],
  [ "Papa", "Tuberculo" ]
]

product_list.each do |name, description|
  Product.create( name: name, description: description )
end

# variant_list = [
#   [ "Tenis", 99.99, 1 ],
#   [ "Sandalias", 29.99, 1 ],
#   [ "Pastusa", 10, 2 ],
#   [ "Criolla", 5, 2 ],
# ]

# variant_list.each do |name, price, product_id|
#   Variant.create( name: name, description: description )
# end
