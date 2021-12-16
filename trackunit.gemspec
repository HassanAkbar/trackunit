
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trackunit/version"

Gem::Specification.new do |spec|
  spec.name          = "trackunit"
  spec.version       = TrackUnit::VERSION
  spec.authors       = ["Hassan"]
  spec.email         = ["hassanakbar2@gmail.com"]

  spec.summary       = "REST API for Trackunit"
  spec.description   = "TrackUnit REST API"
  spec.homepage      = "https://github.com/HassanAkbar/trackunit"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/HassanAkbar/trackunit"
    spec.metadata["changelog_uri"] = "https://github.com/HassanAkbar/trackunit"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("activesupport", ">= 6", "< 8")
  spec.add_dependency("httparty", ">= 0.17.1", "< 0.21.0")



  spec.add_development_dependency "bundler", ">=2.2.10"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "=0.14.1"
  spec.add_development_dependency "pry-rails", "=0.3.9"
  spec.add_development_dependency "webmock", "=3.14.0"
  spec.add_development_dependency 'simplecov', '0.21.2'

end
