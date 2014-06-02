require 'helper'

class App

  def call(env)
    [200, {}, ['MIKE']]
  end
end

class TestApp < Minitest::Test

  include Rack::Test::Methods
  include Swagger::Test

  path '/users'
  description 'User resource'

  def app
    App.new
  end

  def test_swagger
    assert_equal Swagger::SWAGGER_VERSION, Swagger.swagger_version
    assert_equal 'My API', Swagger.resource_listing.info.title
  end

  def test_swagger_resource
    refute Swagger.resource_listing.apis.empty?
    assert_equal '/users', self.class.resource.path
    assert_equal 'User resource', self.class.resource.description
  end

  def test_swagger_get
    swagger(:index) do |swagger|
      swagger.summary 'Summary'
      swagger.notes   'Notes'

      swagger.request do |request|
        get '/users'
      end

      swagger.response do |response|
        assert last_response.ok?
        assert_equal 'MIKE', last_response.body
      end
    end
  end
end
