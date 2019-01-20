class CreateFoodItems < ActiveRecord::Migration[5.2]
  def change
    create_table :food_items do |t|
    	t.string :name,		null: false
    	t.decimal :price,	null: false
    	t.integer :type,	null: false
    	t.belongs_to :restaurant, foreign_key: true
    	t.timestamps
    end
  end
end
