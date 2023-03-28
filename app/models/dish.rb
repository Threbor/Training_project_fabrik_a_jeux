class Dish < ApplicationRecord
  has_many :join_dishes_tags

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
