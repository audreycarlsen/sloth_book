class Post < ActiveRecord::Base
  validates :content, presence: :true

  belongs_to :user
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

end
