class CreateSizzlers < ActiveRecord::Migration[7.1]
  def change
    create_table :sizzlers do |t|
      t.string :title
      t.string :location
      t.string :cooking_style
      t.integer :price
      t.string :speciality
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
