# frozen_string_literal: true

module Postcodes
  module Services
    module AllowedValues
      class Base
        class << self
          def call(file = 'data/allowed.yml')
            yaml(file)[:allowed][section].map(&:downcase) rescue [] # rubocop:disable Style/RescueModifier
          end

          def yaml(file)
            YAML.load_file(file).deep_symbolize_keys
          end
        end
      end
    end
  end
end
