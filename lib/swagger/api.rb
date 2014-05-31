module Swagger
  class Api

    attr_reader :swagger_version, :resource_listing

    def initialize
      @swagger_version  = SWAGGER_VERSION
      @resource_listing = ResourceListing.new
    end

    def method_missing(meth, *args)
      binding.pry
      if @resource_listing.respond_to? meth
        @resource_listing.send meth, *args
      elsif @resource_listing.info.respond_to? meth
        @resource_listing.info.send meth, *args
      else
        binding.pry
        super
      end
    end

    # def method_missing(meth, *args)
    #   binding.pry
    #   accessor = "#{meth}="
    #   if respond_to?(accessor)
    #     send(accessor, args.first)
    #   else
    #     super
    #   end
    # end
  end
end
