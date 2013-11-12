# -*- encoding: utf-8 -*-
require File.expand_path('../lib/afmotion-rocket/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "afmotion-rocket"
  s.version     = AFMotion::Rocket::VERSION
  s.authors     = ["Clay Allsopp", "Ben Kudria"]
  s.email       = ["clay@usepropeller.com", "ben@usepropeller.com"]
  s.homepage    = "https://github.com/usepropeller/afmotion-rocket"
  s.summary     = "AFMotion extensions for Rocket"
  s.description = "AFMotion extensions for Rocket"
  s.license = 'MIT'

  s.files         = `git ls-files`.split($\).delete_if {|x| x.include? "example"}
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "afmotion", "~> 2.0"
  s.add_development_dependency 'rake'
end