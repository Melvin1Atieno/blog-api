require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  teardown do
    Rails.cache.clear
  end
 
  test "Should return all posts" do	
      get api_v1_posts_path
      assert_response 200
    end
    
    test "Should create a new post" do
      assert_difference('Post.count') do
        post api_v1_user_posts_path(@user.id),
        params: {
          title: @post.title,
          text: @post.text
        },
        headers: {"Accept": "Application/json"}
        # binding.pry
    end
    assert_response 201
  end

  test "should get post by id" do
    get api_v1_post_path(@post.id)
    assert_response 200
  end

  test "Should return error if post with given id does not exist" do
    get api_v1_post_url(id: 1234)
    assert_response 404
  end

  test "Should be able to update single post" do
      patch api_v1_post_path(@post.id),
      params: { 
        title: "updated title",
        text: "updated text"
      },
    headers: {"Accept": "Application/json"}
    @post.reload
    assert_response 200
    assert_equal "updated title", @post.title 
    assert_equal "updated text", @post.text 
  end

  test "Should return error if requested post for update does not exist" do
    patch api_v1_post_path(1234),
    params: { 
      title: "updated title",
      text: "updated text"
    },
  headers: {"Accept": "Application/json"}
    assert_response 404
  end

  test "Should delete post" do
    assert_difference('Post.count', -1) do
      delete api_v1_post_path(id:@post.id)
      # binding.pry
    end
    assert_response 204
  end
 

end
