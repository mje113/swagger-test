require 'minitest'
require 'swagger/test/assertions'
require 'swagger/test/request'
require 'swagger/test/response'

module Swagger
  module Test

    def self.included(klass)
      klass.send(:include, Assertions)
      klass.send(:extend, ClassMethods)
      resource = Swagger::Spec::Resource.new
      klass.instance_variable_set :@resource, resource
      Swagger.resource_listing.apis << resource
    end

    def swagger(operation)
      raise ArgumentError unless block_given?
      # setup operation
      yield Swagger::Spec::Operation.new(operation)
    end

    module ClassMethods

      def resource
        @resource
      end

      def path(path)
        @resource.path = path
      end

      def description(description)
        @resource.description = description
      end
    end
  end
end
