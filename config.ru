# frozen_string_literal: true

$LOAD_PATH.unshift "#{__dir__}/lib"
ENV['ROOT_PATH'] = __dir__

require_relative 'config/boot'
run Postcodes::Base
