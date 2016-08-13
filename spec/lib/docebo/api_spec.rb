require 'spec_helper'

describe Docebo::API do
  let(:api) do
    Docebo::API.new
  end

  describe '#code' do
    let(:parameters) do
      Docebo::Parameters.new({hello: '123', test: 'world'})
    end
    let(:code) { api.send(:code, parameters) }

    it 'generates Docebo X-Authorization code' do
      expect(code).to eq 'Docebo dGhlLWtleTphMTAwOTg4ZTlmZGJiMmM1ODNmMjY2ZDcxMjdjMDMxZTRhOTZjZDRi'
    end
  end

  describe '#rest_url' do
    let(:rest_url) do
      api.send(:rest_url, 'course', 'listCourses')
    end

    it 'generates REST URL' do
      expect(rest_url).to eq 'hqc.docebosaas.com/api/course/listCourses'
    end

    context 'api or method is missing' do
      let(:rest_url) do
        api.send(:rest_url, '', '')
      end

      it 'raises error if api or method is missing' do
        expect { rest_url }.to raise_error(Docebo::ArgumentError)
      end
    end

  end

  describe '#send_request' do
    context 'if block given' do
      it 'yields the block' do
        VCR.use_cassette('legacy/course/listCourses.success') do
          api.send_request('course', 'listCourses', {}) do |result|
            expect(result).to be_truthy
          end
        end
      end
    end

    context 'if block not given' do
      let(:result) do
        VCR.use_cassette('legacy/course/listCourses.success') do
          api.send_request('course', 'listCourses', {})
        end
      end

      it 'returns result' do
        expect(result).to be_truthy
      end
    end

    context 'URL is not found' do
      it 'should raise NotFound error' do
        expect do
          VCR.use_cassette('legacy/500') do
            api.send_request('lorem', 'ipsum', {})
          end
        end.to raise_error Docebo::RequestError
      end
    end
  end
end
