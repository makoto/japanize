# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "japanize/version"

Gem::Specification.new do |s|
  s.name        = "japanize"
  s.version     = Japanize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Makoto Inoue"]
  # s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{Simple calculation in Japanese}
  s.description = %q{eg: １　に　２　を　たす}

  s.rubyforge_project = "japanize"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
