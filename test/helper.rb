require 'pry'
require 'swagger'
require 'rack/test'
require 'minitest/autorun'

Minitest.after_run {
  puts MultiJson.dump(Swagger.to_doc, pretty: true)
  Swagger.apis.each do |api|
    puts MultiJson.dump(api.to_doc, pretty: true)
  end
}

class Minitest::Test

  Swagger.init do |api|
    api.api_version = '1.0'
    api.title       = 'My API'
  end

end
