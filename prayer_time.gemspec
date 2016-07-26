# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prayer_time/version'

Gem::Specification.new do |spec|
  spec.name          = "prayer_time"
  spec.version       = PrayerTime::VERSION
  spec.authors       = ["Ecmel Kaytazoğlu"]
  spec.email         = ["ecmel.kytz@gmail.com"]

  spec.summary       = "This gem obtains to praying times from Presidency of Religious Affairs"
  spec.description   = "This gem obtains to praying times from Presidency of Religious Affairs"
  spec.homepage      = "https://github.com/ecmelkytz/prayer_time"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rest-client"
end
