
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geocoder_here_maps/version"

Gem::Specification.new do |spec|
  spec.name          = "geocoder_here_maps"
  spec.version       = GeocoderHereMaps::VERSION
  spec.authors       = ["Arpit Jain"]
  spec.email         = ["arpit@bigbinary.com"]

  spec.summary       = %q{Extends geocoder for HERE maps.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "geocoder", ">= 1.5.1", "< 1.7.0"
end
