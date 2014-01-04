class Post < ActiveRecord::Base
  validates :content, presence: :true

  belongs_to :recipient, :class_name => 'User'
  belongs_to :author, :class_name => 'User'

end
