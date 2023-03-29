class Tag < ApplicationRecord
  has_many :join_dishes_tags
  has_many :dishes, through: :join_dishes_tags

  validates :title, presence: true
end
