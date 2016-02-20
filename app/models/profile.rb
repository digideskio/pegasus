class Profile < ActiveRecord::Base
  belongs_to :account

    # TODO: After_create create empty record for media
  has_one :avatar, -> { where(type: 'avatar') }, as: 'owner', class_name: 'Medium'
  has_one :header, -> { where(type: 'header') }, as: 'owner', class_name: 'Medium'
end
