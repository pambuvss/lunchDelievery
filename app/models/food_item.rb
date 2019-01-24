class FoodItem < ApplicationRecord
  belongs_to :restaurant
  has_many :images, dependent: :destroy
  has_many :order_list
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, :numericality => { :greater_than => 0 }, presence: true
  validates :name, presence: true
  validates :type_of_course, presence: true
  validates_associated :restaurant
  

  enum type_of_course: [:first_course, :main_course, :drink]

  def self.by_date_and_restaurant_id date, restaurant_id
    where(created_at: date.midnight..date.end_of_day)
      .where restaurant_id: restaurant_id
  end

  def self.valid_for_order? first, main, drink
    one_restaurant?(first, main, drink) &&
    one_date?(first, main, drink)
  end

private

  def self.one_restaurant? first, main, drink
    first.restaurant == main.restaurant &&
    main.restaurant == drink.restaurant
  end

  def self.one_date? first, main, drink
    first.created_at.strftime("%Y-%m-%d") == main.created_at.strftime("%Y-%m-%d") &&
    main.created_at.strftime("%Y-%m-%d")  == drink.created_at.strftime("%Y-%m-%d")
  end  
end