# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require File.join(File.expand_path('../mrblib', __FILE__), "cloudwalk", "version.rb")

Gem::Specification.new do |spec|
  spec.name          = "cloudwalk"
  spec.version       = Cloudwalk::VERSION
  spec.authors       = ["Thiago Scalone"]
  spec.email         = ["thiago@cloudwalk.io"]
  spec.summary       = "CLI for Cloudwalk projects"
  spec.description   = "CloudWalk CLI for posxml and ruby applications."
  spec.homepage      = "https://cloudwalk.io/cli"
  spec.license       = "MIT"

  spec.files         = Dir["exe/*"] + Dir["lib/**/*.rb"]
  spec.executables   = Dir["bin/*"].collect { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = 'bin'
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "rake"
  spec.add_dependency "bundler"
end
