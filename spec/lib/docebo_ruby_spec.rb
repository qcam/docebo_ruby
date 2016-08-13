require 'spec_helper'

describe DoceboRuby do
  describe 'configuration' do
    it 'sets the configuration' do
      DoceboRuby.configure do |config|
        expect(config).to be_a(DoceboRuby::Configuration)
        config.saas_url = 'http://example.com'
        config.api_url = 'http://api.example.com'
        config.api_key = 'THE-KEY'
        config.api_secret = 'THE-SECRET'
        config.sso_token = 'THE-TOKEN'
      end

      expect(DoceboRuby.config.saas_url).to eq 'http://example.com'
      expect(DoceboRuby.config.api_url).to eq 'http://api.example.com'
      expect(DoceboRuby.config.api_key).to eq 'THE-KEY'
      expect(DoceboRuby.config.api_secret).to eq 'THE-SECRET'
      expect(DoceboRuby.config.sso_token).to eq 'THE-TOKEN'
    end
  end
end
