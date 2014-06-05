module Swagger
  module Spec
    class Parameter
      include Spec

      swagger_attrs :param_type, :name, :description, :required, :allow_multiple

      def initialize
        @required = true
      end

      private

      def type_cast(ruby_value)
        case ruby_value
        when String                then "string"
        when Float                 then "number"
        when Integer               then "integer"
        when TrueClass, FalseClass then "boolean"
        when Hash                  then "object"
        when Array                 then "array"
        when NilClass              then "null"
        else                            "any"
        end
      end
    end
  end
end
