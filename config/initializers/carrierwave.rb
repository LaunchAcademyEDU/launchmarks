CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV["AWS_KEY"],
      :aws_secret_access_key  => ENV["AWS_SECRET"]
    }
    config.fog_directory  = "launchmarks-#{Rails.env}"
  end
end
