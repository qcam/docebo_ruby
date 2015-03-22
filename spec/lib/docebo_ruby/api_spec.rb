require 'spec_helper'

describe DoceboRuby::API do
  let(:api) do
    DoceboRuby::API.new
  end

  describe '#code' do
    let(:parameters) do
      DoceboRuby::Parameters.new({test: '123', hello: 'world'})
    end
    let(:code) { api.send(:code, parameters) }

    it 'generates Docebo X-Authorization code' do
      expect(code).to eq 'Docebo VEVTVF9LRVk6N2U5YzQ0ZjBhODU5NzgzN2UxNzE3ZTA1YzZiMGM4ZjZhMzIxNDY0Ng=='
    end
  end

  describe '#rest_url' do
    let(:rest_url) do
      api.send(:rest_url, 'course', 'listCourses')
    end

    it 'generates REST URL' do
      expect(rest_url).to eq 'example.com/course/listCourses'
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
    context 'if block given' do
      it 'yields the block' do
        api.send_request('course', 'listCourses', {}) do |result|
          expect(result).to be
        end
      end
    end

    context 'if block not given' do
      let(:result) do
        api.send_request('course', 'listCourses', {})
      end

      it 'returns result' do
        expect(result).to be
      end
    end

    context 'URL is not found' do
      it 'should raise NotFound error' do
        expect do 
          api.send_request('lorem', 'ipsum', {}) 
        end.to raise_error DoceboRuby::NotFound
      end
    end
  end
end
