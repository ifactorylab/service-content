CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAJOLRQ5O3RQ3PCCPQ',
    aws_secret_access_key: 'JiA8g3Rjzj27ZWnhl9zdaIQXR37ycucHcGIC8IE3',
    region:                'eu-west-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.storage        = :fog
  config.fog_directory  = 'service-content-development'
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
