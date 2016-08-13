require 'spec_helper'

describe Docebo::Resource do
  describe '.api=' do
    before do
      Docebo::Resource.api = 'test'
    end

    it 'sets the api' do
      expect(Docebo::Resource.api).to eq 'test'
    end
  end
end
