cache [@post]
object @post
attributes :title

child main_comments: :main_comments do
  extends 'posts/comment'
end
