class ChangeAuthorIDtoAuthorNameInPost < ActiveRecord::Migration
  def change
    add_column :posts, :author, :string
    remove_column :posts, :author_id
  end
end
