# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mailfire/version"

Gem::Specification.new do |s|
  s.name        = "mailfire"
  s.version     = Mailfire::VERSION
  s.authors     = ["ryanlower"]
  s.email       = ["ryan@academia.edu"]
  s.homepage    = "http://academia.edu"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "mailfire"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency 'tinder'
end
