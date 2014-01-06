require 'spec_helper'

describe Friendship do

  describe 'validations' do
    let(:friendship){Friendship.new(user_id: 1, friend_id: 2, status: 'pending')}

    it 'must have a user' do
      friendship.user_id = nil
      expect(friendship).to be_invalid
    end

    it 'must have a friend' do
      friendship.friend_id = nil
      expect(friendship).to be_invalid
    end

    it 'must have a status' do
      friendship.friend_id = nil
      expect(friendship).to be_invalid
    end
  end
end