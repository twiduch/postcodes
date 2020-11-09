# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Sending postcode', type: :request do
  it 'reports incorrect code' do
    response = get('/?postcode=abc')
    expect(response.body).to include('not valid')
  end

  it 'reports valid code' do
    VCR.use_cassette('correct_postcode', record: :new_episodes) do
      response = get('/?postcode=se17qd')
      expect(response.body).to include('is valid')
    end
  end

  it 'reports unknown code as valid' do
    VCR.use_cassette('correct_postcode', record: :new_episodes) do
      response = get('/?postcode=SH2%2041AA')
      expect(response.body).to include('is valid')
    end
  end

  it 'reports allowed code as valid' do
    VCR.use_cassette('correct_postcode', record: :new_episodes) do
      response = get('/?postcode=HP201SQ')
      expect(response.body).to include('is valid')
    end
  end

  it 'reports invalid code' do
    VCR.use_cassette('not valid', record: :new_episodes) do
      response = get('/?postcode=NE301DP')
      expect(response.body).to include('not valid')
    end
  end
end
