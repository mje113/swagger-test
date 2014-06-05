module Swagger
  module Spec
    class ResourceMessage
      include Spec

      swagger_attrs :code, :message, :response_model

    end
  end
end
