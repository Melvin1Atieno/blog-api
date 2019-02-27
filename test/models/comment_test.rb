require 'test_helper'

class CommentTest < ActiveSupport::TestCase

def setup
  @comment = comments(:one)
end

test 'invalid without comment body' do
  @comment.body = nil
  assert_not @comment.save, 'Saved comment without body'
  assert_not_nil @comment.errors[:body]
end
end
