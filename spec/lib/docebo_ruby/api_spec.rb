require 'spec_helper'

describe DoceboRuby::API do
  let(:api) do
    DoceboRuby::API.new(key: '111', secret: '222', url: 'example.com') 
  end

  describe '#code' do
    let(:parameters) do
      DoceboRuby::Parameters.new({test: '123', hello: 'world'})
    end

    it 'generates Docebo X-Authorization code' do
      expect(api.send(:code, parameters)).to include 'Docebo 111:'
    end
  end

  describe '#rest_url' do
    let(:rest_url) do
      api.send(:rest_url, 'user', 'authenticate')
    end

    it 'generates REST URL' do
      expect(rest_url).to eq 'example.com/user/authenticate'
    end

    context 'api or method is missing' do
      let(:rest_url) do
        api.send(:rest_url, '', '')
      end

      it 'raises error if api or method is missing' do
        expect { rest_url }.to raise_error(DoceboRuby::ArgumentError)
      end
    end

  end

  describe '#send_request' do
    before do
      stub_request(:post, 'example.com')
        .to_return(status: [200, 'OK'])
      stub_request(:post, 'example.com/user/show')
        .to_return(status: [200, 'OK'])
      stub_request(:post, 'example.com/lorem/ipsum')
        .to_return(status: [404, 'OK'])
    end

    context 'if block given' do
      it 'yields the block' do
        api.send_request('user', 'show', {a: 1}) do |result|
          expect(result.code).to eq 200
        end
      end
    end

    context 'if block not given' do
      let(:result) do
        api.send_request('user', 'show', {a: 1})
      end

      it 'returns result' do
        expect(result.code).to eq 200
      end
    end

    context 'URL is not found' do
      it 'should raise NotFound error' do
        expect do 
          api.send_request('lorem', 'ipsum', {a: 1}) 
        end.to raise_error DoceboRuby::NotFound
      end
    end
  end
end
