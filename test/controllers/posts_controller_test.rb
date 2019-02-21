require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
 
  test "Should return all posts" do	
      
      get '/api/v1/posts'
      assert_response 200
  end

  test "Should create a new post" do
    assert_difference('Post.count'){
      post '/api/v1/posts',
      params: {
        "title": "post title",
        "text": "This is the text contained in the post"
      },
      headers: {"Accept": "Application/json"}
    }
    assert_response 201
  end

  test "should get post by id" do
    get '/api/v1/posts/@post.id'
    assert_response 200
  end
end
