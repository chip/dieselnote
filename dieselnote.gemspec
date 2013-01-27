# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'diesel_note'

Gem::Specification.new do |s|
  s.name        = 'diesel_note'
  s.version     = DieselNote::VERSION
  s.authors     = ["Culley Smith"]
  s.email       = ["culley.smith@gmail.com"]
  s.homepage    = %q{https://theairstrange.net}
  s.summary     = %q{A proof of concept DSL for building a Song Catalog.}
  s.description = %q{This is a naive internal DSL showing the ease with which a DSL can be built in Ruby.}

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency 'reek', '~> 1.2'
  s.add_development_dependency 'rspec', '~> 2.11'
  s.add_development_dependency 'simplecov', '~> 0.7'

  git_files            = `git ls-files -z`.split("\0") rescue ''
  s.files              = git_files
  s.test_files         = `git ls-files -z -- {test,spec,features}/*`.split("\0")
  s.require_paths      = ['lib']
end
