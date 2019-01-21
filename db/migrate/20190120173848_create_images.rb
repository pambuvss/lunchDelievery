class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.belongs_to :food_item
      t.attachment :photo

      t.timestamps
    end
  end
end
