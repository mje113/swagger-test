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
        uri = URI(uri)

        if params.respond_to?(:to_str)
          # Assuming JSON body
          params = MultiJson.load(params)
          params = symbolize_keys(params)
        end

        # Rack::Test does not support query params and POST bodies
        # in the same request so extract from the uri if possible
        unless uri.query.nil?
          params.merge!(uri_params(uri.query))
        end

        params.each_pair do |key, value|
          @parameters << Parameter.new(key, value)
        end
      end

      private

      def uri_params(query)
        Hash[ query.split('&').map { |q| a = q.split('='); a[0] = a[0].to_sym; a } ]
      end

      def symbolize_keys(hash)
        {}.tap do |new_hash|
          hash.each_pair do |key, value|
            key   = key.respond_to?(:to_str)    ? key.to_sym : key
            value = value.respond_to?(:to_hash) ? symbolize_keys(value) : value
            new_hash[key] = value
          end
        end
      end
    end
  end
end
