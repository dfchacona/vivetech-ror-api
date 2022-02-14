require 'rails_helper'

RSpec.describe Product, type: :routing do
  it 'get all products should route correctly' do
    expect(get("/products")).
      to route_to("products#read_all")
  end

  it 'get product with a given id should route correctly' do
    expect(get("/product/8")).
      to route_to(:controller => "products", :action => "read", :id => "8")
  end
end
