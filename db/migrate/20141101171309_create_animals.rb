class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :identifier
      t.integer :sex
      t.integer :type

      t.timestamps
    end
  end
end
