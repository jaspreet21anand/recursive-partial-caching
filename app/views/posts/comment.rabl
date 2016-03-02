attributes :commenter, :body

child replies: :replies do
  extends 'posts/comment'
end
