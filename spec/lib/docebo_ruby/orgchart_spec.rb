require 'spec_helper'

describe DoceboRuby::Orgchart do
  it 'wraps up Docebo LMS Orgchart' do
    expect(DoceboRuby::Orgchart.api).to eq 'orgchart'
  end

  describe '.create' do
    context 'valid params' do
      it 'creates node at docebo' do
        result = DoceboRuby::Orgchart.create_node\
                   code: 'FirstNode123',
                   translation: { english: 'First Node' }

        expect(result['success']).to be_truthy
        expect(result['org_id']).to eq 123
      end
    end
  end
end
