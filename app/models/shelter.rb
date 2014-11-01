# == Schema Information
#
# Table name: shelters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Shelter < ActiveRecord::Base
  has_many :animals
  has_many :photos, as: :imageable
  
  accepts_nested_attributes_for :photos
end
