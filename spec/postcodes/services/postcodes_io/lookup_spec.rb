# frozen_string_literal: true

require 'spec_helper'

module Postcodes
  module Services
    module PostcodesIo
      describe Lookup do
        subject(:service) { described_class.call(postcode) }

        context 'when existing postcode' do
          let(:postcode) { 'SE17QD' }

          it 'returns proper values' do
            VCR.use_cassette('correct_postcode', record: :new_episodes) do
              expect(service[:status]).to eq 200
              expect(service[:result][:lsoa]).to eq 'Southwark 034A'
            end
          end
        end

        context 'when wrong postcode' do
          let(:postcode) { 'ABC' }

          it 'returns 404 status' do
            VCR.use_cassette('wrong_postcode') do
              expect(service[:status]).to eq 404
            end
          end
        end
      end
    end
  end
end
