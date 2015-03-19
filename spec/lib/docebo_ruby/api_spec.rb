require 'rspec'
require 'docebo_ruby'

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
end
