module Swagger
  module Spec
    class Parameter
      include Spec

      PARAM_TYPES = %w(path query body header form).freeze

      swagger_attrs :param_type, :name, :description,
                    :required, :allow_multiple

      def initialize(name, value)
        @name = name
        @param_type = type_cast(value)
        @required = true
      end

      private

      def type_cast(ruby_value)
        case ruby_value
        when String                then 'string'
        when Float                 then 'number'
        when Integer               then 'integer'
        when TrueClass, FalseClass then 'boolean'
        when Hash                  then 'object'
        when Array                 then 'array'
        when NilClass              then 'null'
        else                            'any'
        end
      end
    end
  end
end
