require 'spec_helper'

describe DoceboRuby::Resource do
  describe '.check_username' do
    context 'user exists' do
      it 'shows user existence as true' do
        existence = DoceboRuby::User.check_username('jahuang')
        expect(existence).to be_truthy
      end
    end

    context 'user not found' do
      it 'shows user existence as false' do
        existence = DoceboRuby::User.check_username('nouser')
        expect(existence).to be_falsey
      end
    end
  end

  describe '.create' do
    it 'creates user at Docebo' do
      expect( 
        DoceboRuby::User.create(
          userid: 'jahuang',
          firstname: 'Jack',
          lastname: 'Huang',
          email: 'jack@example.com'
        )
      ).to be_truthy
    end
  end

  describe '.authenticate' do
    context 'valid credentials' do
      it 'authenticates user via Docebo API' do
        expect(DoceboRuby::User.authenticate('jahuang', '123123123')).to eq '12345'
      end
    end

    context 'invalid credentials' do
      it 'returns false' do
        expect(DoceboRuby::User.authenticate('jahuang', '111222333')).to be_falsey
      end
    end
  end
end
