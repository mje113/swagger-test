module Swagger
  module Spec
    class Operation
      include Spec

      swagger_attrs :method, :summary, :notes, :nickname, :authorizations,
                    :parameters, :response_messages, :produces, :consumes,
                    :deprecated

      def initialize(action)
        @nickname = action
        @parameters = []
        @response_messages = []
        @deprecated = 'false'
      end

      def get(uri, params, env)
        @method = 'GET'
        # setup params
      end
    end
  end
end
