# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swagger/version'

Gem::Specification.new do |spec|
  spec.name          = "swagger-test"
  spec.version       = Swagger::VERSION
  spec.authors       = ["Mike Evans"]
  spec.email         = ["mike@urlgonomics.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '>= 5.0'
  spec.add_development_dependency 'pry', '0.9.12.6'

  spec.add_dependency             'rack'
  spec.add_dependency             'rack-test'
  spec.add_dependency             'multi_json'
  spec.add_dependency             'json-schema'
end
