# frozen_string_literal: true

module Postcodes
  class Base < Sinatra::Base
    get '/?' do
      @result = CheckPostcode.call(params[:code])
      haml :index
    end
  end
end
