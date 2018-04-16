# -*- encoding: utf-8 -*-
# stub: deep_cloneable 2.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "deep_cloneable"
  s.version = "2.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Reinier de Lange"]
  s.date = "2018-04-11"
  s.description = "Extends the functionality of ActiveRecord::Base#dup to perform a deep clone that includes user specified associations. "
  s.email = "rjdelange@icloud.com"
  s.extra_rdoc_files = ["LICENSE"]
  s.files = ["LICENSE"]
  s.homepage = "http://github.com/moiristo/deep_cloneable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "This gem gives every ActiveRecord::Base object the possibility to do a deep clone."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 6", ">= 3.1.0"])
    else
      s.add_dependency(%q<activerecord>, ["< 6", ">= 3.1.0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 6", ">= 3.1.0"])
  end
end
