CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                         # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID']',    # required unless using use_iam_profile
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']',# required unless using use_iam_profile
  }
  config.storage=:fog
  config.permissions=0666
  config.cache_dir="#{Rails.root}/tmp/"
  config.fog_directory  = ENV'[FOG_DIRECTORY]'                                      # required                                                # optional, defaults to true
  config.fog_attributes = { cache_control=>"max-age=#{365.days.to_i}" }
end
