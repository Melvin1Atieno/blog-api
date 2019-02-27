require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = posts(:one)
  end

  test 'invalid without title' do
    @post.title = nil
    assert_not @post.save, 'Saved post without title'
    assert_not_nil @post.errors[:title]
  end

  test 'invalid without text' do
    @post.text = nil
    assert_not @post.save, 'Saved post without text'
    assert_not_nil @post.errors[:text]
  end
end
