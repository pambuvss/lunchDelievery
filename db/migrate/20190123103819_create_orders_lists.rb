class CreateOrdersLists < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_lists do |t|
    	t.belongs_to :order,		foreign_key: true
    	t.belongs_to :food_item, 	foreign_key: true
    end
  end
end
