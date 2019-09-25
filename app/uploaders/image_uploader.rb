class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "image-uploaders/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [640, 480]

  process convert: 'jpg'

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def size_range
    1..10.megabytes
  end
end
