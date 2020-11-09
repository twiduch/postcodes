# frozen_string_literal: true

require 'spec_helper'

module Postcodes
  module Validators
    VALID_LSOA = %w[soUthwaRk Lambeth].freeze

    describe Lsoa do
      subject(:validator) { described_class.call(lsoa_param) }

      VALID_LSOA.each do |lsoa|
        context 'when correct LSOA' do
          let(:lsoa_param) { lsoa }

          it 'returns true' do
            expect(validator).to be_truthy
          end
        end
      end

      context 'when incorrect LSOA' do
        let(:lsoa_param) { 'NotListed' }

        it 'returns false' do
          expect(validator).to be_falsey
        end
      end
    end
  end
end
