# frozen_string_literal: true

require 'spec_helper'
require 'pushy_notifier/pushy_service'

RSpec.describe PushyNotifier::PushyService do
  let(:api_key) { 'test_api_key' }
  let(:device_token) { 'test_device_token' }
  let(:message) { 'Test message' }

  describe '#send_notification' do
    it 'sends a notification using HTTParty' do
      stub_request(:post, /api.pushy.me/)

      described_class.new(api_key).send_notification(device_token, message)

      expect(a_request(:post, /api.pushy.me/)).to have_been_made.once
    end

    it 'logs an error if sending notification fails' do
      allow(HTTParty).to receive(:post).and_raise(StandardError, 'Test error')
      allow(Rails.logger).to receive(:info)

      expect(Rails.logger).to receive(:info).with(/Something went wrong while sending notification/)

      described_class.new(api_key).send_notification(device_token, message)
    end
  end
end
