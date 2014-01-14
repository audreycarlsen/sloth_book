class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :remote_ip
      t.integer :visit_count
      t.integer :pageview_count

      t.timestamps
    end
  end
end
