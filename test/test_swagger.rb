require 'helper'

class App

  def call(env)
    [200, {}, ['MIKE']]
  end
end

class TestApp < Minitest::Test

  include Rack::Test::Methods
  include Swagger::Test

  def app
    App.new
  end

  def test_swagger
    assert Swagger.api
    assert_equal Swagger::SWAGGER_VERSION, Swagger.api.swagger_version
    assert_equal 'My API', Swagger.api.title
  end

  def test_swagger_get
    swagger(:index) do |swagger|
      swagger.summary 'Summary'
      swagger.notes   'Notes'

      swagger.request do
        get '/', { name: 'mike' }
      end

      swagger.response do
        assert last_response.ok?
        assert_equal 'MIKE', last_response.body
      end
    end
  end
end
