require 'helper'

class App

  def call(env)
    [200, {}, ['']]
  end
end

class TestApp < Minitest::Test

  include Rack::Test::Methods
  include Swagger::Test

  def app
    App.new
  end

  swagger.path = '/users'
  swagger.description = 'User resource'

  def test_swagger
    assert_equal Swagger::SWAGGER_VERSION, Swagger.swagger_version
    assert_equal 'My API', Swagger.resource_listing.info.title
  end

  def test_swagger_resource
    refute Swagger.resource_listing.apis.empty?
    assert_equal '/users', self.class.resource.path
    assert_equal 'User resource', self.class.resource.description
  end

  def test_swagger_index
    swagger(:index) do |swagger|
      swagger.summary = 'Summary 1'
      swagger.notes   = 'Notes 1'

      get '/users'
      assert last_response.ok?
    end
  end

  def test_swagger_show
    swagger(:show) do |swagger|
      swagger.summary = 'Summary 2'
      swagger.notes   = 'Notes 2'

      get '/users', user_id: '12345'
      assert last_response.ok?
    end
  end

  def test_swagger_create
    swagger(:create) do |swagger|
      swagger.summary = 'Summary 3'
      swagger.notes   = 'Notes 3'

      post '/users?key=123', user_id: '12345'
      assert last_response.ok?
    end
  end
end
