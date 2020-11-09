# frozen_string_literal: true

module Postcodes
  class Base < Sinatra::Base
    get '/?' do
      @postcode = params[:postcode]
      @result = Operations::CheckPostcode.call(@postcode)
      @lsoa = Services::AllowedValues::Lsoa.call
      @allowed_postcodes = Services::AllowedValues::Postcodes.call

      haml :index
    end
  end
end
