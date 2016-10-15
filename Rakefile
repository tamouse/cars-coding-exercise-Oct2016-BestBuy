$:.unshift(File.expand_path('../lib',__FILE__))

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :default => :spec

namespace :drive do
  desc "Drive the Camaro"
  task :camaro do
    require "cars"
    ::Cars::Camaro.new.drive
  end
end
