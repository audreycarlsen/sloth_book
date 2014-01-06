require 'spec_helper'

describe User do

  describe 'validations' do
    let(:user1){User.new(name:'Audrey', email:'audrey@audrey.com')}
    let(:user2){User.new(name:'Carl', email:'carl@carl.com')}

    it 'must have a name' do
      user1.name = nil
      expect(user1).to be_invalid
    end

    it 'must have a unique email' do
      user1.save
      user2.email = 'Audrey'
      expect(user2).to be_invalid
    end

    it 'must have a correctly formatted email' do
      user1.email = 'audreyaudreycom'
      expect(user1).to be_invalid
    end
  end
end