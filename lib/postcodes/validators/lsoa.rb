# frozen_string_literal: true

module Postcodes
  module Validators
    class Lsoa
      attr_reader :lsoa, :lsoa_provider

      def self.call(lsoa)
        new(lsoa).call
      end

      def initialize(lsoa, lsoa_provider = nil)
        @lsoa = lsoa
        @lsoa_provider = lsoa_provider || default_lsoa_provider
      end

      def call
        lsoa.to_s.downcase.start_with?(*lsoa_provider.call)
      end

      private

      def default_lsoa_provider
        Services::AllowedValues::Lsoa
      end
    end
  end
end
