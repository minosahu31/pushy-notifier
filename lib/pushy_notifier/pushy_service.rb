# frozen_string_literal: true

module PushyNotifier
  # This class provides functionality for sending push notifications
  # using the Pushy service.
  class PushyService
    def initialize(api_key)
      @api_key = api_key
    end

    def send_notification(device_token, message)
      headers = { 'Content-Type' => 'application/json' }
      body = { to: device_token, data: { message: message } }.to_json
      HTTParty.post("https://api.pushy.me/push?api_key=#{@api_key}", body: body, headers: headers)
    rescue StandardError => e
      Rails.logger.info "Something went wrong while sending notification: #{e.message}"
    end
  end
end
