class AddUserReferenceToRestaurant < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :restaurant, foreign_key: true
  end
end
