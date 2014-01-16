class ChangeDefaultVisitCount < ActiveRecord::Migration
  def change
    change_column :visitors, :visit_count, :integer, default: 1
    change_column :visitors, :pageview_count, :integer, default: 1
  end
end
