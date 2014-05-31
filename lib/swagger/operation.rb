module Swagger
  class Operation

    def initialize(action)
      @action = action
    end

    def summary(str)

    end

    def notes(str)

    end

    def request
      yield
    end

    def response
      yield
    end
  end
end
