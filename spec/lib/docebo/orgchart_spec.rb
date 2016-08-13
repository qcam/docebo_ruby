require 'spec_helper'

describe Docebo::Orgchart do
  it 'wraps up Docebo LMS Orgchart' do
    expect(Docebo::Orgchart.api).to eq 'orgchart'
  end

  describe '.create' do
    context 'valid params' do
      it 'creates node at docebo' do
        VCR.use_cassette('legacy/orgchart/createNode') do
          result = Docebo::Orgchart.create_node\
                     code: 'A',
                     translation: { english: 'the-a-node' }

          expect(result['success']).to be_truthy
          expect(result['id_org']).to eq '1'
        end
      end
    end
  end
end
