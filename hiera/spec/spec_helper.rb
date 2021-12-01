# This file is managed via modulesync
# https://github.com/voxpupuli/modulesync
# https://github.com/voxpupuli/modulesync_config
<<<<<<< HEAD
RSpec.configure do |c|
  c.mock_with :rspec
end

=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'bundler'
include RspecPuppetFacts

<<<<<<< HEAD
if File.exist?(File.join(__dir__, 'default_module_facts.yml'))
  facts = YAML.load(File.read(File.join(__dir__, 'default_module_facts.yml')))
  if facts
    facts.each do |name, value|
      add_custom_fact name.to_sym, value
    end
  end
end

=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
if Dir.exist?(File.expand_path('../../lib', __FILE__))
  require 'coveralls'
  require 'simplecov'
  require 'simplecov-console'
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ]
  SimpleCov.start do
    track_files 'lib/**/*.rb'
    add_filter '/spec'
    add_filter '/vendor'
    add_filter '/.vendor'
    add_filter Bundler.configured_bundle_path.path
  end
end

RSpec.configure do |c|
<<<<<<< HEAD
=======
  default_facts = {}
  default_facts.merge!(YAML.load(File.read(File.expand_path('../default_facts.yml', __FILE__)))) if File.exist?(File.expand_path('../default_facts.yml', __FILE__))
  default_facts.merge!(YAML.load(File.read(File.expand_path('../default_module_facts.yml', __FILE__)))) if File.exist?(File.expand_path('../default_module_facts.yml', __FILE__))
  c.default_facts = default_facts

>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  # Coverage generation
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
