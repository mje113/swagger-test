module Swagger
  module Spec
    class Operation

      def initialize(action)
        @action   = action
        @request  = Request.new
        @response = Response.new
      end

      def summary(str)

      end

      def notes(str)

      end

      def request
        yield @response
      end

      def response
        yield @response
      end
    end
  end
end
