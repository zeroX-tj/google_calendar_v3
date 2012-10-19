# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "google_calendar_v3/version"

Gem::Specification.new do |s|
  s.name        = "google_calendar_v3"
  s.version     = GoogleCalendarV3::VERSION
  s.authors     = ["Niels Vandekeybus"]
  s.email       = ["nvdk@arguslabs.be"]
  s.homepage    = ""
  s.summary     = "Small, quick wrapper for google_calendar api (v3)"
  s.description = "Small, quick wrapper for google_calendar api (v3)"



  s.rubyforge_project = "google_calendar_v3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "httparty"
end
