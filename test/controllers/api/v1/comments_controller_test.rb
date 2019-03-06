require 'test_helper'

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @request_params[:data][:type] = 'comment'
    @request_params[:data][:attributes] = attributes_for(:comment)
    @token = authenticated_user
    @post = create(:post_with_comments)
  end

  teardown do
    Rails.cache.clear
  end

  test "Should get all comments to a post" do
    get api_v1_post_comments_path(post_id:@post.id),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 200
  end


  test "should be able to create a comment for a specific post" do
    assert_difference('Comment.count') do
      @request_params[:data][:attributes][:body] = "This is one of the best"
      post api_v1_post_comments_path(post_id:@post.id),
      params: @request_params,
      headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    end
    assert_response 201
  end
  
  test "Should be able to get a single comment" do
    get api_v1_comment_path(id:@post.comments[1].id),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 200
  end

  test "should not  update a  comment if not owner" do
    patch api_v1_comment_path(id:@post.comments[1].id),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 401
  end

  test "should not delete a coment without post/comment ownership" do
    delete api_v1_comment_path(id:@post.comments[1].id),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 401
  end

end
