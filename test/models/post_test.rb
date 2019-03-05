require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should not save post without valid credentials' do
    @post = Post.create
    assert @post.errors[:title].present?, 'expects missing title error'
    assert @post.errors[:text].present?, 'expects missing body error'
  end

  test 'should create post' do
    assert_difference('Post.count') do
      create(:user) do |user|
        user.posts.create(attributes_for(:post))
      end
    end
  end
end
