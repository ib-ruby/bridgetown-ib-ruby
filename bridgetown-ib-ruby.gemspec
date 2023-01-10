# frozen_string_literal: true

require_relative "lib/bridgetown-ib-ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-ib-ruby"
  spec.version       = BridgetownIbRuby::VERSION
  spec.author        = "Dr. Hartmut Bischoff"
  spec.email         = "topofocus@gmail.com"
  spec.summary       = "Plugin to access the Interactive Brokers TWS-API from Bridgetown"
  spec.homepage      = "https://github.com/topofocus/bridgetown-ib-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]

 # spec.required_ruby_version = ">= 3.1.2"

  spec.add_dependency "bridgetown", ">= 1.2.0.beta4", "< 2.0"
  spec.add_dependency "ib-api"
  spec.add_dependency "ib-symbols"
  spec.add_dependency "ib-extensions"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 13.0"
end
