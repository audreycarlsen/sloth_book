class AddCookieToVisitor < ActiveRecord::Migration
  def change
    add_column :visitors, :cookie_id, :integer
  end
end
