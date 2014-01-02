class Post < ActiveRecord::Base
  validates :content, presence: :true

  belongs_to :user, :foreign_key => 'author_id'
  belongs_to :friend, :class_name => 'User', :foreign_key => 'recipient_id'


end
