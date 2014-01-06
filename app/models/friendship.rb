class Friendship < ActiveRecord::Base
  validates :friend_id, presence: :true
  validates :user_id, presence: :true
  validates :status, presence: :true

  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end