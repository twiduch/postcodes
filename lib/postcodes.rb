# frozen_string_literal: true

module Postcodes
  class Base < ::Sinatra::Base
    register Sinatra::Reloader

    set :root,                    File.dirname(__FILE__)
    set :views,                   (proc { File.join(root, 'postcodes/views') })
    set :public_folder,           (proc { File.join(root, '../public') })
    set :static_cache_control,    [:public, { max_age: 1 }]
    set :haml, format: :html5

    enable :raise_errors
  end
end
