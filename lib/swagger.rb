require 'multi_json'
require 'swagger/spec'
require 'swagger/test'
require 'swagger/version'

module Swagger

  SWAGGER_VERSION = '1.2'.freeze

  @resource_listing = Spec::ResourceListing.new

  module_function

  def init
    yield self
  end

  def swagger_version
    SWAGGER_VERSION
  end

  def resource_listing
    @resource_listing
  end

  def method_missing(meth, *args)
    if resource_listing.respond_to? meth
      resource_listing.send meth, *args
    elsif resource_listing.info.respond_to? meth
      resource_listing.info.send meth, *args
    else
      super
    end
  end

  def to_doc
    resource_listing.to_doc
  end

end
