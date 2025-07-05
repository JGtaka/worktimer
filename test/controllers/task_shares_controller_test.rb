require "test_helper"

class TaskSharesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get task_shares_create_url
    assert_response :success
  end

  test "should get destroy" do
    get task_shares_destroy_url
    assert_response :success
  end
end
