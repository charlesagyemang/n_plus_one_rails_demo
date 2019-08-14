# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class CreatePostWithComment
  def initialize(title:, body:)
    #code
    @title = title
    @body  = body
  end

  def create_post_and_comment(value)
    #code
    post = Post.create(title: "#{@title}_#{value}", body: "#{@body}_#{value}")
    comment = Comment.create(post.id, ["Comment 0 #{value}", "Comment 3 #{value}", "Comment 7 #{value}"].sample!)
  end

  def number_of_times(x)
    x.times.each do
      create_post_and_comment(x.to_s)
    end
  end

end

create_post_with_comment = CreatePostWithComment.new("title", "Body Of Post")
create_post_with_comment.number_of_times(2)
