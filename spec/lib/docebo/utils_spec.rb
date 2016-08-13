require 'spec_helper'

describe Docebo::Utils do
  describe '.collect_values' do
    it 'collects all values of a hash' do
      hash = {
        foo: 1,
        bar: 'foo',
        x: { y: 'z', z: 'y' }
      }

      expect(Docebo::Utils.collect_values(hash)).to eq '1,foo,z,y'
    end
  end

  describe '.codice' do
    it 'generates the codice' do
      params = { userid: 'john' }
      secret = 'xxx'

      expect(Docebo::Utils.codice(secret, params)).to eq Digest::SHA1.hexdigest('john,xxx')
    end
  end

  describe '.code' do
    it 'generates the codice' do
      params = { userid: 'john' }
      secret = 'xxx'
      key = '$$$'

      allow(Docebo::Utils).to receive(:codice).and_return('aaa')

      expect(Docebo::Utils.code(key, secret, params)).to eq(
        "Docebo #{Base64.strict_encode64('$$$:aaa')}"
      )
    end
  end
end
