class Post < ActiveRecord::Base
  has_many :comments
  has_many :main_comments, -> { where(parent_id: nil) }, class_name: Comment
end
