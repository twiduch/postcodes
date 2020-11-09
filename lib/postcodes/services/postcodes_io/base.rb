# frozen_string_literal: true

module Postcodes
  module Services
    class Base
      attr_reader :postcode

      def self.call(*args)
        new(*args).call
      end

      def call
        JSON.parse(response).deep_symbolize_keys
      end

      private

      def response
        @response ||= Net::HTTP.send(method, URI(url))
      end

      def url
        "#{protocol}://#{host}/#{path}#{params}"
      end

      def params
        ''
      end

      def path
        ''
      end

      def host
        'postcodes.io'
      end

      def protocol
        'http'
      end
    end
  end
end
