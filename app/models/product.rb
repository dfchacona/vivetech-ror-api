class Product < ApplicationRecord
  has_many :variants

  validates :name, presence: true
  validates :description, presence: true
end
