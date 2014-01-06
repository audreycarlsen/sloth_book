class User < ActiveRecord::Base
  validates :name, presence: :true
  validates :email, presence: :true, uniqueness: true, format: { with: /\w+@\w+\.\w{3}/i }
  
  has_secure_password

  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  before_save :set_default_pic

  def set_default_pic
    if photo_url.blank?
      photo_url = 'default.jpg'
    end
  end

  def pending_friendships_to_respond_to
    inverse_friendships.where(:status => 'pending')
  end

  def pending_friendship_names
    pending_friendship_names = []

    friendships.where(:status => 'pending').each do |friendship|
      pending_friendship_names << friendship.friend.name
    end

    inverse_friendships.where(:status => 'pending').each do |inverse_friendship|
      pending_friendship_names << inverse_friendship.user.name
    end

    pending_friendship_names
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
