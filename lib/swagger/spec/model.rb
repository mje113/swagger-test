module Swagger
  module Spec
    class Model
      include Spec

      swagger_attrs :id, :description, :required, :properties, :sub_types,
                    :discriminator

      def initialize
        @properties = Properties.new
      end
    end
  end
end
