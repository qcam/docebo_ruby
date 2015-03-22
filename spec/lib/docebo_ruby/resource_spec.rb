require 'spec_helper'

describe DoceboRuby::Resource do
  describe '.api=' do
    before do
      DoceboRuby::Resource.api = 'test'
    end

    it 'sets the api' do
      expect(DoceboRuby::Resource.api).to eq 'test'
    end
  end
end
