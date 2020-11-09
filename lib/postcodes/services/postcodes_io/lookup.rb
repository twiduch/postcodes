# frozen_string_literal: true

module Postcodes
  module Services
    module PostcodesIo
      class Lookup < Base
        attr_reader :postcode

        def initialize(postcode) # rubocop:disable Lint/MissingSuper
          @postcode = postcode
        end

        private

        def method
          :get
        end

        def path
          "postcodes/#{postcode}"
        end
      end
    end
  end
end
