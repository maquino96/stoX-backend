IEX::Api.configure do |config|
    config.publishable_token = ENV['iex_publish'] # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = ENV['iex_secret'] # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/stable' # use 'https://sandbox.iexapis.com/v1' for Sandbox
  end