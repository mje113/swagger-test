module Swagger
  module Spec
    class Resource
      include Spec

      swagger_attrs :path, :description
    end
  end
end
