class User < ActiveRecord::Base
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: true, format: { with: /\w+@\w+\.\w{3}/i }
  
  has_secure_password

  has_many :friendships
  has_many :friends, :through => :friendships
end
