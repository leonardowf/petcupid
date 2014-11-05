# == Schema Information
#
# Table name: animals
#
#  id                         :integer          not null, primary key
#  name                       :string(255)
#  identifier                 :string(255)
#  sex                        :integer
#  category                   :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  shelter_id                 :integer
#  animal_description         :text
#  animal_size                :integer
#  birthday                   :date
#  neutered                   :boolean
#  medical_issues             :boolean
#  medical_issues_description :text
#  child_friendly             :boolean
#  dog_friendly               :boolean
#  cat_friendly               :boolean
#  litter_trained             :boolean
#  other_info                 :text
#

class Animal < ActiveRecord::Base
  belongs_to :shelter
  has_many :photos, as: :imageable
end
