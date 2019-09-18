
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/wix/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-wix"
  spec.version       = Omniauth::Wix::VERSION
  spec.authors       = ["Tom Netzband"]
  spec.email         = ["tomnez@gmail.com"]

  spec.summary       = "OAuth for Wix"
  spec.description   = "OAuth for Wix"
  spec.homepage      = "https://github.com/tomnez/omniauth-wix"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
