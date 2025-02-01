# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'
require_relative 'lib/version_parser'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'lib/**/*.rb'
end

task default: :spec

desc 'Install the gem locally'
task :install do
  sh 'gem build amyf.gemspec'
  sh "gem install amyf-#{gem_version}.gem"
end

desc 'Lints the project. What are we? Cavemen? Clean your dishes!'
task :lint do
  sh 'rubocop --fail-level A'
end

desc 'Does validations prior to releasing a version'
task :release_validations do
  Rake::Task['spec'].invoke
  Rake::Task['lint'].invoke
end

desc 'Does validations and then releases a new version of the gem'
task release: :release_validations do
  Rake::Task['release_unsafe'].invoke
end

desc 'Pushes a new version to Rubygems without prior validations'
task :release_unsafe do
  bump_gemspec_version

  Rake::Task['install'].invoke

  sh 'git add .'
  sh "git commit -m 'Update gem version to #{gem_version}'"
  sh "git tag -a #{gem_version} -m 'Update gem version to #{gem_version}'"
  sh 'git push'

  sh "gem push amyf-#{gem_version}.gem"

  puts "✅ New gem version #{new_version} released successfully"
end

private

def gem_version
  spec = Bundler.load_gemspec_uncached(gemspec_file)
  spec.version
end

def gemspec_file
  Dir['*.gemspec'].first
end

def bump_gemspec_version
  new_version = VersionParser.parse(gem_version.to_s).bump_minor.to_s

  content = File.read(gemspec_file)
  updated_content = content.gsub(/(s\.version\s*=\s*['"])(.*?)(['"])/, "\\1#{new_version}\\3")

  File.write(gemspec_file, updated_content)

  puts "Updated gemspec version to #{new_version}"
end
