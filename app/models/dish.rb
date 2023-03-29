class Dish < ApplicationRecord
  has_many :join_dishes_tags
  has_many :tags, through: :join_dishes_tags
  has_many :ordered_items
  has_many :orders, through: :ordered_items
  has_many :ordered_items
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
