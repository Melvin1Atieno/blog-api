require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @request_params[:data][:type] = 'post'
    @request_params[:data][:attributes] = attributes_for(:post)
    @token = authenticated_user
    @post = create(:post)
  end
  
  teardown do
    Rails.cache.clear
  end
  
  test "Should return all posts" do	
    get api_v1_posts_path,
    headers: {"Accept" => "application/vnd.api+json", "Authorization" => @token["auth_token"]}
    assert_response 200
  end
  
  test "should get post by id" do
    get api_v1_post_path(id:@post.id),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 200
  end
  
  test "Should create a new post" do
    assert_difference('Post.count') do
      post api_v1_user_posts_path(user_id: @user.id),
      params:@request_params,
      headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    end
    assert_response 201
  end


  test "Should return error if post with given id does not exist" do
    get api_v1_post_url(id: 1234),
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 404
  end

  test "Should not update post if not owner" do
    @request_params[:data][:attributes][:title] = "updated title"
    @request_params[:data][:attributes][:text] = "updated text"
    patch api_v1_post_path(@post.id),params: @request_params,
    headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    @post.reload
    assert_response 401
    assert_not_equal "updated title", @post.title
    assert_not_equal "updated text", @post.text
  end

  test "Should return error if requested post for update does not exist" do
    patch api_v1_post_path(1234),
    params: { 
      title: "updated title",
      text: "updated text"
    },
  headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 404
  end

  test "Should not delete post if not owner" do
      delete api_v1_post_path(id:@post.id),
      headers: {"Accept": "application/vnd.api+json", "Authorization": @token["auth_token"]}
    assert_response 401
  end
 

end
