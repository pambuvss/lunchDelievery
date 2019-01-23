class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.belongs_to :user,			foreign_key: true
    	t.belongs_to :restaurant, 	foreign_key: true
    	t.string :address,			null: false
    	t.datetime :delivery_time,		null: false
    	t.integer :count,			null: false
    end
  end
end
