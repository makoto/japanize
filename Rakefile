require 'bundler'
Bundler::GemHelper.install_tasks
require 'rake/testtask'
Rake::TestTask.new(:spec) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'spec/**/*spec.rb'
  test.verbose = true
end

