# frozen_string_literal: true

require 'spec_helper'
require 'pushy_notifier'

RSpec.describe PushyNotifier do
  describe '.configure' do
    it 'yields self to the block' do
      expect { |b| described_class.configure(&b) }.to yield_with_args(described_class)
    end
  end

  describe '.pushy_service' do
    let(:api_key) { 'test_api_key' }

    it 'creates a new PushyService with provided api_key' do
      expect(PushyNotifier::PushyService).to receive(:new).with(api_key)
      described_class.pushy_service(api_key)
    end

    it 'creates a new PushyService with configured api_key if not provided' do
      described_class.api_key = api_key
      expect(PushyNotifier::PushyService).to receive(:new).with(api_key)
      described_class.pushy_service
    end
  end
end
