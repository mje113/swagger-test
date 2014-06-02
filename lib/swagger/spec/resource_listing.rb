module Swagger
  module Spec
    class ResourceListing

      attr_accessor :swagger_version, :apis, :api_version, :info, :authorizations

      def initialize
        @api_version     = '1.0'
        @info            = Info.new
        @authorizations  = []
        @apis            = []
      end

      def to_doc
        MultiJson.dump(
          swaggerVersion: swagger_version,
          apis:           apis.map(&:to_doc),
          apiVersion:     api_version,
          info:           info.to_doc,
          authorizations: authorizations
        )
      end
    end
  end
end
