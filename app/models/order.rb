class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items
  has_many :dishes, through: :ordered_items
end
