module Swagger
  module Spec
    class Api
      include Spec

      swagger_attrs :path, :description, :operations

      def initialize(resource)
        @resource   = resource
        @operations = []
      end

      def to_doc
        @path = @resource.path
        @description = @resource.description
        super
      end
    end
  end
end
