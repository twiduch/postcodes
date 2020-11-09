# frozen_string_literal: true

module Postcodes
  module Services
    module AllowedValues
      class Postcodes < Base
        class << self
          def section
            :postcodes
          end
        end
      end
    end
  end
end
