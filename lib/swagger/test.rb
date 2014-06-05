require 'minitest'
require 'swagger/test/assertions'

module Swagger
  module Test

    MUTEX = Mutex.new


    def self.included(klass)
      klass.send(:include, Assertions)
      klass.send(:extend,  ClassMethods)

      resource = Swagger::Spec::Resource.new

      klass.instance_variable_set :@resource, resource
      Swagger.resource_listing.apis << resource
    end

    def swagger(operation)
      raise ArgumentError unless block_given?

      # I think that synchronizing here is probably unnessecary
      # as I believe Minitest runs each test in a new instance.
      MUTEX.synchronize {
        @current_operation = Swagger::Spec::Operation.new(@current_operation)
        yield @current_operation
        self.class.resource.api.operations << @current_operation
      }
    end

    def get(uri, params = {}, env = {}, &block)
      # do something with params
      @current_operation.get(uri, params, env)
      super
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
