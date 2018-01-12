class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # if Rails.env.production?
  #   storage :fog
  # else
  #   storage :file
  # end


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  # version :print do
  #   version :thumb    { process :resize_to_fit => [32, 32] }
  #   version :preview  { process :resize_to_fit => [256, 256] }
  #   version :full     { process :resize_to_fit => [2048, 2048] }
  # end
  #
  # version :web do
  #   version :thumb    { process :resize_to_fit => [32, 32] }
  #   version :preview  { process :resize_to_fit => [128, 128] }
  #   version :full     { process :resize_to_fit => [1024, 768] }
  # end
  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  version :medium do
    process :resize_to_fill => [300, 300]
  end

  version :small do
    process :resize_to_fill => [140, 140]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default_profile.jpg"].compact.join('_'))
  end
end
