require 'rubygems'
require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new(:core) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace --color']
end