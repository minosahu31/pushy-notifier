# frozen_string_literal: true

require_relative "pushy_notifier/version"
require "pushy_notifier/pushy_service"

# The PushyNotifier module provides functionality for sending push notifications
# using the Pushy service. It includes configuration options and a service class
# for sending notifications.
module PushyNotifier
  class << self
    attr_accessor :api_key

    def configure
      yield self
    end

    def pushy_service(api_key = nil)
      PushyService.new(api_key || @api_key)
    end
  end
end
