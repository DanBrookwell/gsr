class AddToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :street_address, :string
  	add_column :guests, :city, :string
  	add_column :guests, :state, :string
  	add_column :guests, :zip, :string
  	add_column :guests, :banner, :text
  end
end
