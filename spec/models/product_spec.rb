require 'rails_helper'

RSpec.describe Product, type: :model do
  it "product should be creating correctly" do
    Product.create(name: "Tenis", description: "Zapatos para correr")
    expect(Product.count).to eq 1
  end

  it "products must have a description" do
    Product.create( name: "Tenis")
    expect(Product.count).to eq 0
  end

  it "products must have a name" do
    Product.create( description: "Zapatos para correr")
    expect(Product.count).to eq 0
  end
end
