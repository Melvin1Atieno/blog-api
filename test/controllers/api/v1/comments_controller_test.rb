require 'test_helper'

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @comment = comments(:one)
    @post = posts(:one)
    @user = users(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "Should get all comments associated with a post" do
    get api_v1_post_comments_path(@post.id)
    # binding.pry
    assert_response 200
  end

  test "Should be able to get all comments associated with user" do
    get api_v1_user_comments_path(user_id:@user.id)
    assert_response 200
  end

  test "should be able to create a comment for a specific post" do
    assert_difference('Comment.count') do
      post api_v1_post_comments_path(user_id:@user.id,post_id:@post.id),
      params: {
        body:"This is a new comment"
      },
      headers: {"Accept": "Application/json"}
      binding.pry
  end
  assert_response 201
  end

  test "Should be able to get a single comment" do
    get api_v1_comment_path(id:@comment.id)
    assert_response 200
  end

  test "should be able to update a specific comment" do
    patch api_v1_comment_path(id:@comment.id)
    assert_response 200
  end

  test "should delete a specific comment" do
    assert_difference('Comment.count', -1) do
    delete api_v1_comment_path(user_id:@user.id,id:@comment.id)
    end
    assert_response 204
  end

end
