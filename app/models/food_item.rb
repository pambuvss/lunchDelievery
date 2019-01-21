class FoodItem < ApplicationRecord
  belongs_to :restaurant
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
  validates :name, presence: true
  validates :type_of_course, presence: true
  validates_associated :restaurant
  

  enum type_of_course: [:first_course, :main_course, :drink]
end