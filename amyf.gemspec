# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'amyf'
  s.version   = '0.1.0'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'Helps with daily tasks'
  s.description = 'Impossible to live without it'
  s.authors   = ['fdiaz']
  s.email     = ['patchdiaz@gmail.com']
  s.homepage  = 'https://twoheartedyoga.com'
  s.license   = 'MIT'
  s.files     = Dir.glob('{lib,bin}/**/*')
  s.require_path = 'lib'
  s.required_ruby_version = '>= 3.3.0'
  s.executables = ['amyf']
end
