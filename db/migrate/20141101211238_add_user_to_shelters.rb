class AddUserToShelters < ActiveRecord::Migration
  def change
    add_reference :shelters, :user, index: true
  end
end
