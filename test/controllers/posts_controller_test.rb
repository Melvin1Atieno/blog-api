require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @post = posts(:one)
  end

  teardown do
    Rails.cache.clear
  end
 
  test "Should return all posts" do	
      get '/api/v1/posts'
      assert_response 200
  end

  test "Should create a new post" do
    assert_difference('Post.count'){
      post '/api/v1/posts',
      params: {
        user: @user,
        title: @post.title,
        text: @post.text
      },
      headers: {"Accept": "Application/json"}
    }
    assert_response 201
  end

  test "should get post by id" do
    get '/api/v1/posts/', params: {id: @post.id}
    assert_response 200
  end

  test "Should return error if post with given id does not exist" do
    get '/api/v1/posts/', params: {id:'6712'}
    assert_response 404
  end 
end
