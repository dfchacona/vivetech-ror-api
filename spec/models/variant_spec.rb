require 'rails_helper'

RSpec.describe Variant, type: :model do
  it "variant should be created correctly" do
    Product.create(id: 5, name: "Tenis", description: "Zapatos para correr")
    Variant.create(product_id: 5, name: "Talla 30", price: 1000)
    expect(Variant.count).to eq 1
  end

  it "variant price must be greater than 0" do
    Product.create(id: 5, name: "Tenis", description: "Zapatos para correr")
    Variant.create(product_id: 5, name: "Talla 30", price: -10)
    expect(Variant.count).to eq 0
  end

  it "variant must have a name" do
    Variant.create(product_id: 5, price: 10)
    expect(Variant.count).to eq 0
  end
end
