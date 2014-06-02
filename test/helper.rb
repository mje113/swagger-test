require 'pry'
require 'swagger'
require 'rack/test'
require 'minitest/autorun'

class Minitest::Test

  Swagger.init do |api|
    api.api_version = '1.0'
    api.title       = 'My API'
  end

end
