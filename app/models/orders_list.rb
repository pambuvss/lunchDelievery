class OrdersList < ApplicationRecord
	belongs_to :order
	belongs_to :food_item

	def self.create order, first, main, drink
		OrdersList.new(order_id: order.id, food_item_id: first.id).save
  		OrdersList.new(order_id: order.id, food_item_id: main.id).save
  		OrdersList.new(order_id: order.id, food_item_id: drink.id).save
	end
end