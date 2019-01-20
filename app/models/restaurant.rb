class Restaurant < ApplicationRecord
  has_many :user
  has_many :food_item
end