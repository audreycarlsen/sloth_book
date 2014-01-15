class ChangeCookieIdToString < ActiveRecord::Migration
  def change
    change_column :visitors, :cookie_id, :string
  end
end
