require 'spec_helper'

describe Docebo::Resource do
  describe '.check_username' do
    context 'user exists' do
      it 'shows user existence as true' do
        VCR.use_cassette('legacy/user/checkUsername.success') do
          existence = Docebo::User.check_username('john')
          expect(existence).to be_ok
          expect(existence.data['firstname']).to eq 'John'
        end
      end
    end

    context 'user not found' do
      it 'shows user existence as false' do
        VCR.use_cassette('legacy/user/checkUsername.failure') do
          result = Docebo::User.check_username('nouser')

          expect(result).to be_error
          expect(result.data['message']).to eq 'User not found'
        end
      end
    end
  end

  describe '.create' do
    context 'valid params' do
      it 'creates user at Docebo' do
        VCR.use_cassette('legacy/user/create.success') do
          result = Docebo::User.create\
                     userid: 'jahuang',
                     firstname: 'Jack',
                     lastname: 'Huang',
                     email: 'jack@example.com'
          expect(result).to be_ok
          expect(result.data['idst']).to eq 13017
          expect(result.data['success']).to be_truthy
        end
      end
    end
  end

  describe '.authenticate' do
    context 'valid credentials' do
      it 'authenticates user via Docebo API' do
        VCR.use_cassette('legacy/user/authenticate') do
          result = Docebo::User.authenticate('john', '123123123')
          expect(result).to be_ok
          expect(result.data['success']).to be_truthy
        end
      end
    end

    context 'invalid credentials' do
      it 'returns false' do
        VCR.use_cassette('legacy/user/authenticate.failure') do
          expect(Docebo::User.authenticate('noone', '111222333')).to be_error
        end
      end
    end
  end

  describe '.sso_url' do
    it 'generates SSO URL based on username' do
      expect(Docebo::User.sso_url 'jack').to match(/auth_regen=1/)
      expect(Docebo::User.sso_url 'jack').to match(/login_user=jack/)
    end
  end
end
