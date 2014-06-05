module Swagger
  module Spec
    def self.included(klass)
      klass.send(:extend, ClassMethods)
    end

    def to_doc
      {}.tap do |doc|
        self.class.swagger_attrs.each do |attr|
          value = send(attr)
          if value.respond_to?(:to_doc)
            value = value.to_doc
          elsif value.respond_to?(:to_ary)
            value = value.map(&:to_doc)
          end

          doc[camelize(attr)] = value
        end
      end
    end

    def camelize(str)
      words = str.to_s.dup.split(/_/)
      words[1..-1].map(&:capitalize!)
      words.join('')
    end

    module ClassMethods
      def swagger_attrs(*attrs)
        if attrs.empty?
          @swagger_attrs
        else
          attr_accessor *attrs
          @swagger_attrs = attrs
        end
      end
    end
  end
end

require 'swagger/spec/api'
require 'swagger/spec/info'
require 'swagger/spec/resource_listing'
require 'swagger/spec/resource'
require 'swagger/spec/operation'
require 'swagger/spec/parameter'
