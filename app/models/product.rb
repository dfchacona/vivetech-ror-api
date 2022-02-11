class Product < ApplicationRecord
  has_many :variants

  validates :name, presence: true
  validates :description, presence: true

  def self.create_products(products)
    successful_products = 0
    products.each do |new_product|
      existing_product = Product.where(["name = ?", new_product[:name]])
      if existing_product
        update_product(existing_product)
      else
        product = Product.new(name: new_product[:name], description: new_product[:description])
        if product.valid?
          if new_product[:variants]
            new_product[:variants].each do |variant|
              new_variant = Variant.new(name: variant[:name], price: variant[:price])
              product.variants << new_variant
            end
          end
          unless product.variants.empty?
            if product.save
              successful_products += 1
            end
          end
        end
      end
    end
    successful_products
  end
end
