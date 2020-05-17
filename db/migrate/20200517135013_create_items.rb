class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :item_scene
      t.string :size
      t.string :status
      t.string :delivery
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_belt
      t.boolean :is_shoes
      t.boolean :is_hat
      t.boolean :is_watch
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
