require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.name        = 'capistrano-git-external'
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Cestari"]
  s.email       = ["dcestari@gmail.com"]
  s.homepage    = "http://github.com/dcestari/capistrano-git-external"
  s.summary     = "Capistrano patch for using git external"
  s.description = "Git External commands need to be run on every deploy before the update_code task, this extension allows the user to activate this functionality"

  s.add_dependency('capistrano', '>=2.5.19')

  s.files = Dir.glob("lib/**/*")
  s.test_files = Dir.glob("test/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test

