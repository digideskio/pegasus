# encoding: utf-8

class MutatableUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  # if $PEGASUS['storage'].nil?
  storage :file
  # else
  # storage $PEGASUS['storage'].to_sym
  # end

  def store_dir
    "uploads/#{model.owner.class.to_s.underscore}/#{model.owner.id}"
  end

  def default_url
    "/images/fallback/#{model.owner.class.to_s.underscore}/#{model.type}_default.png"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    model.type
  end
end
