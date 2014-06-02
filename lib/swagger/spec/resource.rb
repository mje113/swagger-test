module Swagger
  module Spec
    class Resource

      attr_accessor :path, :description

      def to_doc
        {
          path: path,
          description: description
        }
      end
    end
  end
end
