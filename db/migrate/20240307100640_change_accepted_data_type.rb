class ChangeAcceptedDataType < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :accepted, :string
  end
end
