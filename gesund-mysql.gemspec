# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gesund/mysql/version'

Gem::Specification.new do |spec|
  spec.name          = "gesund-mysql"
  spec.version       = Gesund::Mysql::VERSION
  spec.authors       = ["Evgeny Zislis"]
  spec.email         = ["evgeny@devops.co.il"]
  spec.description   = %q{Plugin for Gesund health checker to check MySQL health}
  spec.summary       = %q{MySQL health checks for Gesund}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "gesund"
  spec.add_runtime_dependency "mysql"
end
