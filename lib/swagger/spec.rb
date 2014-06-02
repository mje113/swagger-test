module Swagger
  module Spec
    def swagger_attrs(*attrs)
      attr_accessor *attrs
    end
  end
end

require 'swagger/spec/api'
require 'swagger/spec/info'
require 'swagger/spec/resource_listing'
require 'swagger/spec/resource'
require 'swagger/spec/operation'
require 'swagger/spec/parameter'
