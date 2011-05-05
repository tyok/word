# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "word/version"

Gem::Specification.new do |s|
  s.name        = "word"
  s.version     = Word::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mohammad Satrio"]
  s.email       = ["wolfaeon@gmail.com"]
  s.homepage    = "https://github.com/tyok/word"
  s.summary     = "Extend String with word searching capabilities"
  s.description = "Extend String with word searching capabilities"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths    = ["lib"]

  s.licenses = ["MIT"]

  s.add_development_dependency "bundler", [">= 1.0.0"]
  s.add_development_dependency "minitest", [">= 0"]
end

