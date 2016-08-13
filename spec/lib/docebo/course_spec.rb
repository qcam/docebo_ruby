require 'spec_helper'

describe Docebo::Course do
  it 'wraps up Docebo LMS Course' do
    expect(Docebo::Course.api).to eq 'course'
  end

  describe '.all' do
    let(:result) do
    end

    it 'fetches an array of courses' do
      VCR.use_cassette('legacy/course/courses.success') do
        result = Docebo::Course.all
        expect(result).to be_ok
        expect(result.data['courses']).to be_an Array
        expect(result.data['courses'].size).to eq 2
      end
    end
  end

  describe '.add_user_subscription' do
    let(:result) do
      VCR.use_cassette('legacy/course/addUserSubscription.success') do
        Docebo::Course.add_user_subscription(1, 13017)
      end
    end

    it 'subscribes user to the course' do
      expect(result).to be_ok
      expect(result.data['success']).to be_truthy
    end
  end
end
