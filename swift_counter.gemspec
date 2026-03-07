# frozen_string_literal: true

require_relative "lib/swift_counter/version"

Gem::Specification.new do |spec|
  spec.name = "swift_counter"
  spec.version = SwiftCounter::VERSION
  spec.authors = ["Jake Oeding"]

  spec.summary = "Swift implemented counter via C bridge"
  spec.homepage = "https://github.com/jakeoeding/swift-gem-poc"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["{ext,lib}/**/*.{h,c,rb,swift}"]
  spec.extensions = ["ext/swift_counter/extconf.rb"]
  spec.require_paths = ["lib"]
end
