# == Schema Information
#
# Table name: shelters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  address    :string(255)
#

class Shelter < ActiveRecord::Base
  belongs_to :user
  has_many :animals
  has_many :photos, as: :imageable
  
  accepts_nested_attributes_for :photos
end
