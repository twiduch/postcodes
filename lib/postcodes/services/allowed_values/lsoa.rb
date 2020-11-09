# frozen_string_literal: true

module Postcodes
  module Services
    module AllowedValues
      class Lsoa < Base
        class << self
          def section
            :lsoa
          end
        end
      end
    end
  end
end
