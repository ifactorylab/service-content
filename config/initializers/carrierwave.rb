CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'eu-west-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
  else
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     "test1234",
      aws_secret_access_key: "test1234",
      region:                'eu-west-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
  end

  config.storage        = :fog
  config.fog_directory  = 'service-content-development'
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
