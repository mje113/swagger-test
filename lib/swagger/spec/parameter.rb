module Swagger
  module Spec
    class Parameter

      def initialize(param_type, name, value)
        @name       = name
        @required   = false
        @type       = type_cast(value)
        @param_type = param_type
      end

      def to_doc
        {
          name:      @name,
          required:  @required,
          type:      @type,
          paramType: @param_type
        }
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
