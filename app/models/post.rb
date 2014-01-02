class Post < ActiveRecord::Base
  validates :content, presence: :true

  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
