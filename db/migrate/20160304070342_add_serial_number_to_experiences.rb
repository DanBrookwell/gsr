class AddSerialNumberToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :serialnum, :string
  end
end
