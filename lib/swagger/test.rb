require 'swagger/test/assertions'

module Swagger
  module Test

    def swagger(operation)
      raise ArgumentError unless block_given?
      # setup operation
      yield Swagger::Operation.new(operation)
    end
  end
end
