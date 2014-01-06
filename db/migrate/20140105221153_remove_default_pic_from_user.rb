class RemoveDefaultPicFromUser < ActiveRecord::Migration
  def change
    change_column :users, :photo_url, :string, :default => nil
  end
end
