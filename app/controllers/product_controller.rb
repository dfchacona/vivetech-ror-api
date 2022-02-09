class ProductController < ApplicationController

  def read_all
    products = Product.all

    render status: 200, json: products
  end

end
