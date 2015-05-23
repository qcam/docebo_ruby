require 'spec_helper'

describe DoceboRuby::Course do
  it 'wraps up Docebo LMS Course' do
    expect(DoceboRuby::Course.api).to eq 'course'
  end

  describe '.all' do
    let!(:courses) { DoceboRuby::Course.all }

    it 'fetches an array of courses' do
      expect(courses).to be_an Array
    end

    it 'fetches courses correctly' do
      expect(courses.length).to eq 3
    end

    it 'wraps data using OpenStruct' do
      expect(courses.sample).to be_an OpenStruct
      expect(courses.sample.course_id).not_to be_nil
    end
  end

  describe '.add_user_subscription' do
    let(:result) { DoceboRuby::Course.add_user_subscription(10, 10) }

    it 'subscribes user to the course' do
      expect(result).to be_truthy
    end
  end
end
