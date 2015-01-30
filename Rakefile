require "rubygems"
require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"

$:.unshift File.expand_path("../lib", __FILE__)
require "quickbooks-ruby"

task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end


desc "Open an irb (or pry) session preloaded with Quickbooks"
task :console do
  begin
    require 'pry'
    sh %{pry -I lib -r quickbooks-ruby.rb}
  rescue LoadError => _
    sh 'irb -rubygems -I lib -r quickbooks.rb'
  end
end

require "rubygems"
require "rubygems/package_task"

require "rspec"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(--format documentation --colour)
end

task :default => ["spec"]

$:.unshift File.expand_path("../lib", __FILE__)
require "quickbooks/version"

spec = Gem::Specification.new do |gem|
  gem.name     = "quickbooks-ruby-187"
  gem.version  = Quickbooks::VERSION
  gem.authors = ["Cody Caughlan", "Troy Surrett"]

  gem.homepage = "http://github.com/troysurrett/quickbooks-ruby-187"
  gem.summary  = "REST API to Quickbooks Online via Intuit Data Services v3, forked to work with Ruby 1.8.7"
  gem.license  = 'MIT'
  gem.description = gem.summary

  gem.files = Dir['lib/**/*']

  gem.add_dependency 'oauth'
  gem.add_dependency 'roxml'
  gem.add_dependency 'nokogiri', '~> 1.5.0'
  gem.add_dependency 'activemodel', '3.1.12'
  gem.add_dependency 'json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rr',     '~> 1.0.2'
  gem.add_development_dependency 'rspec',  '2.13.0'
  gem.add_development_dependency 'fakeweb'
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more
# about that here: http://gemcutter.org/pages/gem_docs
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_package] do
  rm "#{spec.name}.gemspec"
end
