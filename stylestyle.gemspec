# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'
 
Gem::Specification.new do |s|
  s.name        = "stylestyle"
  s.version     = "1.0.0"
  s.authors     = ["Conan Rimmer", "Ed Weng"]
  s.email       = ["conan.rimmer@livingsocial.com", "ed.weng@livingsocial.com"]
  s.homepage    = "https://github.com/conanr/style"
  s.summary     = "Wrapper for Cane and Reek for more managable output."
  s.description = "Wrapper for cane and reek used to produce better style with better output."
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"

  s.add_dependency('cane')
  s.add_dependency('reek')
 
  s.executables  = []
  s.bindir       = "bin"
  s.executables  <<  "stylestyle"
  s.files        = Dir.glob("{bin,lib,data}/**/*")
  s.require_path = 'lib'
end