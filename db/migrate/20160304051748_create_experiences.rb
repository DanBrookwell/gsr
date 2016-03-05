class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :details
      t.references :guest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
