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

  enum sex: [ :female, :male ]
  enum category: [ :dog, :cat ]
  enum animal_size: [ :small, :medium, :big ]

  def profile_photo
    if self.photos.any?
      return self.photos.first
    end
    return nil
  end

  def user_owner
    self.shelter.user
  end

  def self.attributes_for_select(field_name)
    pluralized_field_name = field_name.to_s.pluralize.to_sym
    if self.respond_to?(pluralized_field_name)
      enumerables = self.send(pluralized_field_name)
      enumerables.map do |enumerable, _|
        [I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_field_name}.#{enumerable}"), enumerable]
      end
    end
  end

  def translated_field(field_name)
    field_value = send(field_name)
    pluralized_field_name = field_name.to_s.pluralize.to_sym
    I18n.t("activerecord.attributes.#{self.class.model_name.i18n_key}.#{pluralized_field_name}.#{field_value}")
  end
end
