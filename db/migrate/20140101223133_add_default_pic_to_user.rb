class AddDefaultPicToUser < ActiveRecord::Migration
  def change
    change_column :users, :photo_url, :string, :default => "default.jpg"
  end
end
