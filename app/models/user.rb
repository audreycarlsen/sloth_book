class User < ActiveRecord::Base
  validates :name, presence: :true
  validates :email, presence: :true, uniqueness: true, format: { with: /\w+@\w+\.\w{3}/i }
  
  has_secure_password

  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def pending_friends
    inverse_friendships.where(:status => 'pending')
  end

  def not_already_friends?(user_id)
    if friendships.where(friend_id: user_id) == []
      return true
    else
      return false
    end
  end

  def not_already_inverse_friends?(user_id)
    if inverse_friendships.where(user_id: user_id) == []
      return true
    else
      return false
    end
  end

  def friend_count
    friendships.where(:status => 'accepted').count + inverse_friendships.where(:status => 'accepted').count
  end
end
