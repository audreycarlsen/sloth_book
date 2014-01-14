class AddDefaultToVisitor < ActiveRecord::Migration
  def change
    change_column :visitors, :visit_count, :integer, default: 0
    change_column :visitors, :pageview_count, :integer, default: 0
  end
end
