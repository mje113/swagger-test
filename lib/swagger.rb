require 'swagger/api'
require 'swagger/info'
require 'swagger/resource_listing'
require 'swagger/resource'
require 'swagger/operation'
require 'swagger/parameter'
require 'swagger/test'
require 'swagger/version'

module Swagger

  SWAGGER_VERSION = '1.2'.freeze

  module_function

  def init(&block)
    @api = Api.new
    @api.instance_exec &block
  end

  def api
    raise ArgumentError, 'You must init Swagger before accessing your api.' if @api.nil?
    @api
  end

end
