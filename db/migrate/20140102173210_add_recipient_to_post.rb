class AddRecipientToPost < ActiveRecord::Migration
  def change
    add_column :posts, :to, :string
    add_column :posts, :from, :string
    remove_column :posts, :user
  end
end
