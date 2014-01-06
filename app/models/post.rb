class Post < ActiveRecord::Base
  validates :content, presence: :true
  validates :user_id, presence: :true
  validates :author_id, presence: :true

  belongs_to :user
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

end
