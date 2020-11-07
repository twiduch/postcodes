# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'factory_bot'
require 'pry'
require 'httpx'
require 'active_support/core_ext/hash/keys'
require 'sinatra/base'
require 'sinatra/reloader'
$LOAD_PATH.unshift File.join(__dir__, '..')

files = Dir['lib/postcodes/**/*.rb'].sort
files.each { |f| require(f) }

def app
  Postcodes
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
