# frozen_string_literal: true

$LOAD_PATH.unshift __dir__
ENV['ROOT_PATH'] = __dir__

require 'config/boot'
run Postcodes::Base
