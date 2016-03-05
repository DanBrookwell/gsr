class AddNewColumnsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :department, :string
    add_column :experiences, :activity_center, :string
    add_column :experiences, :category, :string
    add_column :experiences, :sub_category, :string
  end
end
