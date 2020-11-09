# frozen_string_literal: true

require 'spec_helper'

module Postcodes
  module Operations
    CORRECT_POSTCODES = [
      '  Se1   7qD ',
      'S E 1 7 Q d  ',
      'sh241aa  ',
      'CT4 5DR'
    ].freeze

    INCORRECT_POSTCODES = [
      nil,
      'SE44QA3',
      'W13 8QN'
    ].freeze

    describe CheckPostcode do
      subject(:check_postcode) { described_class.call(postcode) }

      CORRECT_POSTCODES.each do |code|
        context 'when correct postcode' do
          let(:postcode) { code }

          it 'returns true' do
            VCR.use_cassette('correct_postcode', record: :new_episodes) do
              expect(check_postcode[:status]).to eq(200).or eq(404)
            end
          end
        end
      end

      INCORRECT_POSTCODES.each do |code|
        context 'when incorrect postcode' do
          let(:postcode) { code }

          it 'returns false' do
            VCR.use_cassette('not_valid', record: :new_episodes) do
              expect(check_postcode[:status]).to eq 500
            end
          end
        end
      end
    end
  end
end
