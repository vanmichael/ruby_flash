CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key'],
    #AKIAI376HNBBZL4IZCOA
    aws_secret_access_key: ENV['aws_secret_key']
    #Z0jZDjxHNdfizGSkGfD3e4dxVKb8+JqEEiPEePey
  }
  config.fog_directory  = "vanrubyflash-#{Rails.env}"
end
