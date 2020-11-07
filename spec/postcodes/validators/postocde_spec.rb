# frozen_string_literal: true

require 'spec_helper'

module Postcodes
  module Validators
    CORRECT_POSTCODES = %w[Se17qD SE17QD SH241AA Sh241aA].freeze
    INCORRECT_POSTCODES = %w[Abd SSS17QD].freeze

    describe Postcode do
      subject(:validator) { described_class.call(postcode) }

      CORRECT_POSTCODES.each do |code|
        context 'when correct postcode' do
          let(:postcode) { code }

          it 'returns true' do
            expect(validator).to be_truthy
          end
        end
      end

      INCORRECT_POSTCODES.each do |code|
        context 'when incorrect postcode' do
          let(:postcode) { code }

          it 'returns false' do
            expect(validator).to be_falsey
          end
        end
      end
    end
  end
end
