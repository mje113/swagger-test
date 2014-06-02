module Swagger
  module Spec
    class Info
      extend Spec

      swagger_attrs :title, :description, :terms_of_service_url,
                    :contact, :license, :license_url


    end
  end
end
