class CreateLands < ActiveRecord::Migration[5.2]
  def change
    create_table :lands do |t|
      t.string :land_type
      t.string :purpose
      t.string :listing_name
      t.text :summary
      t.text :size
      t.string :address
      t.boolean :is_tap
      t.boolean :is_electronic
      t.boolean :is_gas
      t.boolean :is_parking
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
