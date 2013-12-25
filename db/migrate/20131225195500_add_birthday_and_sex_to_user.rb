class AddBirthdayAndSexToUser < ActiveRecord::Migration
  def change
    add_column :users, :birth_month, :string
    add_column :users, :birth_day, :string
    add_column :users, :birth_year, :string
    add_column :users, :sex, :string
  end
end
