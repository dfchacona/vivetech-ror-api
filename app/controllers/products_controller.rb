class ProductsController < ApplicationController

  def read_all
    products = Product.all

    render status: 200, json: products
  end

  def read
    product = Product.where(id: params[:id])

    render status: 200, json: product, include: [:variants]
  end

  def create
    product_list = product_params[:_json]
    total_products = product_list.length()
    
    successful_products = Product.create_products(product_list)
    request = Request.create_request(total_products, successful_products)
    
    render status: 200, json: request
  end

  private

    def product_params
      params.permit(:id, _json: [:name, :description, variants: [ :name, :price ]])
    end

end
