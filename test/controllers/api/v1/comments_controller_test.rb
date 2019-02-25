require 'test_helper'

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @comment = comments(:one)
    @post = posts(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "Should get all comments associated with a post" do
    get api_v1_post_comments_path(@post.id)
    assert_response 200
  end
end
