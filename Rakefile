# encoding: utf-8

require "bundler"
Bundler::GemHelper.install_tasks

require "rake"
require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.libs << "lib"
  test.libs << "spec"
  test.pattern = "spec/**/*_spec.rb"
  test.verbose = true
end

task :default => :test

require "rake/rdoctask"
Rake::RDocTask.new do |rdoc|
  require "word/version"

  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "Word #{Word::VERSION}"
  rdoc.rdoc_files.include("README*")
  rdoc.rdoc_files.include("lib/**/*.rb")
end
