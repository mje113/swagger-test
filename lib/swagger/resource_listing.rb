module Swagger
  class ResourceListing

    attr_reader :swagger_version, :apis, :api_version, :info, :authorizations

    def initialize
      @api_version     = '1.0'
      @info            = Info.new
      @authorizations  = []
      @apis            = []
    end
  end
end
