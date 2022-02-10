class ProductsController < ApplicationController

  def read_all
    products = Product.all

    render status: 200, json: products
  end

  def read
    product = Product.where(id: params[:id])

    render status: 200, json: product, include: ['variants']
  end

  def create

    product_list = JSON.parse(request.raw_post)

    total_products = product_list.length()
    successful_products = 0

    product_list.each do |product|
      new_product_variants = []
      if product['variants']
        product['variants'].each do |variant|
          if variant['name'] && variant['price'] > 0
            new_product_variants << variant
          end
        end
        if new_product_variants.length() > 0
          if product['name'] && product['description']
            product = Product.new(name: product['name'], description: product['description'])
            if product.save
              new_product_variants.each do |variant|
                variant = Variant.new(name: variant['name'], price: variant['price'], product_id: product.id)
                variant.save
              end
              successful_products += 1
            end
          end
        end
      end
    end

    number_rejected = total_products - successful_products
    request = Request.new(number_requested: total_products, number_accepted: successful_products, number_rejected: number_rejected)
    request.save
    render status: 200, json: request

  end

  private

    def product_params
      params.permit(:id)
    end

end
