# This is done in order to fool rabl when it scans for dependencies to generate cache digest
# If the partial is placed directly, it would be stuck in an infinite loop and give error - stack level too deep
comment_partial = 'posts/comment'

attributes :commenter, :body

child replies: :replies do
  extends 'posts/comment' #use the variable comment_partial to fix the digest issue
end
