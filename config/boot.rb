# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'net/http'
require 'sinatra/base'
require 'sinatra/reloader'
require 'yaml'

files = Dir['lib/**/*.rb'].map { |f| f.split('/').drop(1).join('/') }.sort
files.each { |f| require(f) }
