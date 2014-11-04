class RenameTypeColumnInAnimals < ActiveRecord::Migration
  def self.up
    rename_column :animals, :type, :category
  end

  def self.down
    rename_column :animals, :category, :type
  end
end
