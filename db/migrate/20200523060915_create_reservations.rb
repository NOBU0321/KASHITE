class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :start_date
      t.string :datetime
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
