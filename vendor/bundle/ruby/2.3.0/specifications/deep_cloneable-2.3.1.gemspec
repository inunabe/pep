# -*- encoding: utf-8 -*-
# stub: deep_cloneable 2.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "deep_cloneable"
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Reinier de Lange"]
  s.date = "2017-10-02"
  s.description = "Extends the functionality of ActiveRecord::Base#dup to perform a deep clone that includes user specified associations. "
  s.email = "r.j.delange@nedforce.nl"
  s.extra_rdoc_files = ["LICENSE", "readme.md"]
  s.files = ["LICENSE", "readme.md"]
  s.homepage = "http://github.com/moiristo/deep_cloneable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "This gem gives every ActiveRecord::Base object the possibility to do a deep clone."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5.2.0", ">= 3.1.0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5.2.0", ">= 3.1.0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5.2.0", ">= 3.1.0"])
  end
end
