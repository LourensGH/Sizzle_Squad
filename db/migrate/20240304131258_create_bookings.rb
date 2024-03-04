class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :sizzler, null: false, foreign_key: true

      t.timestamps
    end
  end
end
