# Clean DB
Variant.destroy_all
Product.destroy_all

# Add records
product_list = [
  [ 1, "Zapatos", "Prenda para los pies" ],
  [ 2, "Papa", "Tuberculo" ]
]

product_list.each do |id, name, description|
  Product.create( id: id, name: name, description: description )
end

variant_list = [
  [ "Tenis", 99.99, 1 ],
  [ "Sandalias", 29.99, 1 ],
  [ "Pastusa", 10, 2 ],
  [ "Criolla", 5, 2 ],
]

variant_list.each do |name, price, product_id|
  Variant.create( name: name, price: price, product_id: product_id )
end
