# frozen_string_literal: true

module Postcodes
  module Operations
    class CheckPostcode
      attr_reader :postcode, :service

      def self.call(postcode)
        new(postcode).call
      end

      def initialize(postcode, service = nil)
        @postcode = normalized_postcode(postcode)
        @service = service || default_postcode_service
      end

      def call
        return message(200, 'unknown') if allowed_postcode?
        return message(500, 'unknown') unless valid_postcode?

        response
      end

      private

      def response
        if response_status == 200
          valid_lsoa? ? message(200, response_lsoa) : message(500, response_lsoa)
        else
          message(response_status, 'unknown')
        end
      rescue # rubocop:disable Style/RescueStandardError
        message(600, 'unknown')
      end

      def message(status, lsoa)
        {
          status: status,
          lsoa: lsoa
        }
      end

      def allowed_postcode?
        Services::AllowedValues::Postcodes.call.include?(postcode)
      end

      def valid_postcode?
        Validators::Postcode.call(postcode)
      end

      def response_status
        @response_status ||= service_response[:status]
      end

      def response_lsoa
        @response_lsoa ||= service_response[:result][:lsoa]
      end

      def valid_lsoa?
        Validators::Lsoa.call(response_lsoa)
      end

      def normalized_postcode(postcode)
        postcode.to_s.gsub(/\s+/, '').downcase
      end

      def service_response
        @service_response ||= service.call(postcode)
      end

      def default_postcode_service
        Services::PostcodesIo::Lookup
      end
    end
  end
end
