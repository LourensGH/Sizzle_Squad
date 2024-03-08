class AddPhotosToSizzlers < ActiveRecord::Migration[7.1]
  def change
    add_column :sizzlers, :user_photos, :json
  end
end
