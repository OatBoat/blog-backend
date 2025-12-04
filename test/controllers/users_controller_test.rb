require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Post.count", 1 do
      post "/posts.json", params: { user: "test", name: "michael test", email: "test.test@gmail.com", password: "1234", password_confirmation: "1234" }
      data = JSON.parse(response.body)
      assert_response 200
    end
  end
end
