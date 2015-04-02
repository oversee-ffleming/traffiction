# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traffiction/version'

Gem::Specification.new do |spec|
  spec.name          = "traffiction"
  spec.version       = Traffiction::VERSION
  spec.authors       = ['Forrest Fleming']
  spec.email         = ['ffleming@oversee.net']
  spec.summary       = %q(Hits a url a specified number of times.  It's like a curl loop, but faster.)
  spec.description   = %q(Performs an HTTParty::get request in a reasonably threaded manner.) <<
                       %q(Primarily useful for manipulating concurrent users displays on staging environments)
  spec.homepage      = 'https://github.com/oversee-ffleming/traffiction'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency 'ruby-progressbar', '~> 1.7'
  spec.add_runtime_dependency 'httparty', '~> 0.13'
end
