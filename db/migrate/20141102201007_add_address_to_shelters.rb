class AddAddressToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :address, :string
  end
end
