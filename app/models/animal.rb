# == Schema Information
#
# Table name: animals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  identifier :string(255)
#  sex        :integer
#  type       :integer
#  created_at :datetime
#  updated_at :datetime
#  shelter_id :integer
#

class Animal < ActiveRecord::Base
  belongs_to :shelter
  has_many :photos, as: :imageable
end
