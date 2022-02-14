class ProductsController < ApplicationController

  # This controller returns all products
  def read_all
    products = Product.all

    render status: 200, json: products
  end

  # This controller returns the product with ID = /:id 
  def read
    product = Product.where(id: params[:id])

    render status: 200, json: product, include: [:variants]
  end

  # This controller creates the product(s) in the body of the request
  # and also creates a record that stores the number of accepted/denied products
  # it returns the information of the created request 
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
