class ChangeRecipientToUserInPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    remove_column :posts, :recipient_id
  end
end
