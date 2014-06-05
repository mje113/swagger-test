module Swagger
  module Spec
    class ResourceListing
      include Spec

      swagger_attrs :swagger_version, :apis, :api_version,
                    :info, :authorizations

      def initialize
        @swagger_version = SWAGGER_VERSION
        @api_version     = '1.0'
        @info            = Info.new
        @authorizations  = []
        @apis            = []
      end
    end
  end
end
