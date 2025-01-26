# frozen_string_literal: true

require 'rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'lib/**/*.rb'
end

task default: :spec

desc 'Install the gem locally'
task install: :build do
  sh 'gem build amyf.gemspec'
  sh "gem install amyf-#{gem_version}.gem"
end

desc 'Cleans up the local pkg'
task :clean do
  rm_rf 'pkg'
end

def gem_version
  spec = Bundler.load_gemspec(Dir['*.gemspec'].first)
  spec.version
end
