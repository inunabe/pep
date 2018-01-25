# -*- encoding: utf-8 -*-
# stub: material_icons 2.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "material_icons"
  s.version = "2.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Angel M Miguel"]
  s.date = "2017-02-27"
  s.description = "Add Google Material Icons in your Rails projects easily. It is a library with +900 icons ;)"
  s.email = "angel@laux.es"
  s.homepage = "http://irb.rocks"
  s.licenses = ["MIT", "Apache-2.0"]
  s.rubygems_version = "2.5.1"
  s.summary = "A simple Rails wrapper for Google Material Icons"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.2"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.2"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.0"])
      s.add_development_dependency(%q<capybara>, ["~> 2.4.4"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.2"])
      s.add_development_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_development_dependency(%q<pry-nav>, ["~> 0.2.4"])
    else
      s.add_dependency(%q<railties>, [">= 3.2"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_dependency(%q<rspec>, ["~> 3.2"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
      s.add_dependency(%q<capybara>, ["~> 2.4.4"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.2"])
      s.add_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_dependency(%q<pry-nav>, ["~> 0.2.4"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.2"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    s.add_dependency(%q<rspec>, ["~> 3.2"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
    s.add_dependency(%q<capybara>, ["~> 2.4.4"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.2"])
    s.add_dependency(%q<pry>, ["~> 0.10.3"])
    s.add_dependency(%q<pry-nav>, ["~> 0.2.4"])
  end
end
