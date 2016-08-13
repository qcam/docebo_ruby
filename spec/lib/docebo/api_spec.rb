require 'spec_helper'

describe Docebo::API do
  let(:api) do
    Docebo::API.new
  end

  describe '#send_request' do
    context 'if block given' do
      it 'yields the block' do
        VCR.use_cassette('legacy/course/listCourses.success') do
          api.send_request('course', 'listCourses', {}) do |result|
            expect(result).to be_a(Docebo::Response)
            expect(result).to be_ok
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
        expect(result).to be_a(Docebo::Response)
        expect(result).to be_ok
      end
    end

    context 'URL is not found' do
      it 'should raise NotFound error' do
        VCR.use_cassette('legacy/500') do
          result = api.send_request('lorem', 'ipsum', {})
          expect(result.code).to eq 500
          expect(result).to be_error
        end
      end
    end
  end
end
