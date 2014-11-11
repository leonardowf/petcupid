# == Schema Information
#
# Table name: photos
#
#  id                      :integer          not null, primary key
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  file_file_name          :string(255)
#  file_content_type       :string(255)
#  file_file_size          :integer
#  file_updated_at         :datetime
#  imageable_id            :integer
#  imageable_type          :integer
#

class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  def parent
    case imageable_type
    when 0
      return Animal.find(self.imageable_id)
    when 1
      return Shelter.find(self.imageable_id)
    end
  end
end
