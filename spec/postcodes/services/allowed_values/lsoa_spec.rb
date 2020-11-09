# frozen_string_literal: true

require 'spec_helper'

module Postcodes
  module Services
    module AllowedValues
      describe Lsoa do
        subject(:service) { described_class.call }

        it 'provides lsoa list' do
          expect(service).to include('southwark', 'lambeth')
        end

        it 'returns empty table if no file' do
          expect(described_class.call('wrong-file')).to eq []
        end
      end
    end
  end
end
