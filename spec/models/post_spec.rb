require 'spec_helper'

describe Post do

  describe 'validations' do
    let(:post){Post.new(content:'Hello, world!', author_id: 1, user_id: 2)}

    it 'must have content' do
      post.content = nil
      expect(post).to be_invalid
    end

    it 'must have an author' do
      post.author_id = nil
      expect(post).to be_invalid
    end

    it 'must have a recipient' do
      post.user_id = nil
      expect(post).to be_invalid
    end
  end
end