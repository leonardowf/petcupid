class AddFieldsToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :animal_description, :text
    add_column :animals, :animal_size, :integer
    add_column :animals, :birthday, :date
    add_column :animals, :neutered, :boolean
    add_column :animals, :medical_issues, :boolean
    add_column :animals, :medical_issues_description, :text
    add_column :animals, :child_friendly, :boolean
    add_column :animals, :dog_friendly, :boolean
    add_column :animals, :cat_friendly, :boolean
    add_column :animals, :litter_trained, :boolean
    add_column :animals, :other_info, :text
  end
end
