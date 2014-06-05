module Swagger
  module Spec
    class Resource
      include Spec

      swagger_attrs :path, :description
      attr_accessor :api

      def initialize
        @api = Api.new(self)
        Swagger.apis << @api
      end
    end
  end
end
