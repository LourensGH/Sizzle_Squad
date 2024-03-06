class AddCoordinatesToSizzlers < ActiveRecord::Migration[7.1]
  def change
    add_column :sizzlers, :latitude, :float
    add_column :sizzlers, :longitude, :float
  end
end
