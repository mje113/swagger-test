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

      %w(get post put patch delete options).each do |method|
        define_method method do |uri, params, env, &block|
          extract_parameters(uri, params, env)
          @method = method.upcase
        end
      end

      def extract_parameters(uri, params, env)

      end
    end
  end
end
