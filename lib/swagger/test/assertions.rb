require 'json-schema'

module Swagger
  module Test
    module Assertions
      def assert_valid_json_schema(schema, json)
        assert JSON::Validator.validate(schema, json)
      end
    end
  end
end
