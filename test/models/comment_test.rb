require 'test_helper'
class CommentTest < ActiveSupport::TestCase
  test 'should not save comment without body' do
    @new_comment = Comment.create
    assert @new_comment.errors[:body].present?, 'expects missing title error'
  end

  test 'should save comment with valid details' do
    assert_difference('Post.count') do
      create(:post) do |post|
        post.comments.create(attributes_for(:comment))
      end
    end
  end
end
