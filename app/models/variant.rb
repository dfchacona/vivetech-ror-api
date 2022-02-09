class Variant < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :price, comparison: { greater_than: 0 }
end
