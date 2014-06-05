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

    %w(get post put patch delete options).each do |method|
      define_method method do |uri, params = {}, env = {}, &block|
        @current_operation.send(method, uri, params, env)
        super(uri, params, env, &block)
      end
    end

    module ClassMethods
      def swagger
        resource
      end

      def resource
        @resource
      end
    end
  end
end
