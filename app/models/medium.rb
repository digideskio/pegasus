class Medium < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  mount_uploader :path, MutatableUploader
  crop_uploaded :path
  process crop: :path

  validates :path, presence: true
  validates_integrity_of :path
  validates_processing_of :path
end
