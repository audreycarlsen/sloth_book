class AddRecipientAndAuthorToPost < ActiveRecord::Migration
  def change
    remove_column :posts, :to
    remove_column :posts, :from
    add_column :posts, :author_id, :integer
    add_column :posts, :recipient_id, :integer
  end
end
