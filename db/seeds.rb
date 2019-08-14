class CreatePostWithComment
  def initialize(title:, body:)
    #code
    @title = title
    @body  = body
  end

  def create_post_and_comment(value)
    #code
    post = Post.create(title: "#{@title}_#{value.to_s}", body: "#{@body}_#{value.to_s}")
    comments = 3.times { create_comment(post, value) }
  end

  def number_of_times(x)
    x.times.each do |m|
      puts m
      self.create_post_and_comment(m)
    end
  end

  private
   def create_comment(post, value)
     #code
     comment = Comment.create(post_id: post.id, body: ["Comment 0 #{value.to_s}", "Comment 3 #{value.to_s}", "Comment 7 #{value.to_s}"].sample)
   end

end

Comment.all.delete_all
Post.all.delete_all
#
create_post_with_comment = CreatePostWithComment.new(title: "title", body: "Body Of Post")
create_post_with_comment.number_of_times(10000)

def n_plus_1
  Post.all.each do |post|
    post.comments.each do |comment|
    end
  end
end

def eager_load
  posts = Post.all.includes!(:comments)
end
