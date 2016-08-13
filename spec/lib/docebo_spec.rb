require 'spec_helper'

describe Docebo do
  describe 'configuration' do
    it 'sets the configuration' do
      Docebo.configure do |config|
        expect(config).to be_a(Docebo::Configuration)
        config.saas_url = 'http://example.com'
        config.api_url = 'http://api.example.com'
        config.api_key = 'THE-KEY'
        config.api_secret = 'THE-SECRET'
        config.sso_token = 'THE-TOKEN'
      end

      expect(Docebo.config.saas_url).to eq 'http://example.com'
      expect(Docebo.config.api_url).to eq 'http://api.example.com'
      expect(Docebo.config.api_key).to eq 'THE-KEY'
      expect(Docebo.config.api_secret).to eq 'THE-SECRET'
      expect(Docebo.config.sso_token).to eq 'THE-TOKEN'
    end
  end
end
