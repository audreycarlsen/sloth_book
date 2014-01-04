class User < ActiveRecord::Base
  validates :name, presence: :true
  validates :email, presence: :true, uniqueness: true, format: { with: /\w+@\w+\.\w{3}/i }
  
  has_secure_password

  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def pending_friends_to_respond_to
    inverse_friendships.where(:status => 'pending')
  end

  def pending_friendships
    pending_friendships = []

    friendships.where(:status => 'pending').each do |friendship|
      pending_friendships << friendship
    end

    inverse_friendships.where(:status => 'pending').each do |inverse_friendship|
      pending_friendships << inverse_friendship
    end

    pending_friendships
  end

  def friend_count
    friendships.where(:status => 'accepted').count + inverse_friendships.where(:status => 'accepted').count
  end

  def find_all_friend_names
    friend_names = []

    friendships.where(:status => 'accepted').each do |friendship|
      friend_names << friendship.friend.name
    end

    inverse_friendships.where(:status => 'accepted').each do |inverse_friendship|
      friend_names << inverse_friendship.user.name
    end

    friend_names
  end
end
