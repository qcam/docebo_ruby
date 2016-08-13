require 'spec_helper'

describe Docebo::Orgchart do
  it 'wraps up Docebo LMS Orgchart' do
    expect(Docebo::Orgchart.api).to eq 'orgchart'
  end

  describe '.create' do
    context 'valid params' do
      it 'creates node at docebo' do
        result = Docebo::Orgchart.create_node\
                   code: 'FirstNode123',
                   translation: { english: 'First Node' }

        expect(result['success']).to be_truthy
        expect(result['org_id']).to eq 123
      end
    end
  end
end
