# frozen_string_literal: true

module Postcodes
  module Validators
    class Postcode
      UK_POSTCODE_REGEX = %r{
        ^(([A-Z][0-9]{1,2})|
        (([A-Z][A-HJ-Y][0-9]{1,2})|
        (([A-Z][0-9][A-Z])|
        ([A-Z][A-HJ-Y][0-9]?[A-Z]))))
        \s?[0-9][A-Z]{2}$
      }ix.freeze

      def self.call(postcode)
        UK_POSTCODE_REGEX.match?(postcode)
      end
    end
  end
end
