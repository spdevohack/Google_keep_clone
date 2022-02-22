require "test_helper"

class NotebooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notebooks_index_url
    assert_response :success
  end

  test "should get new" do
    get notebooks_new_url
    assert_response :success
  end

  test "should get edit" do
    get notebooks_edit_url
    assert_response :success
  end

  test "should get show" do
    get notebooks_show_url
    assert_response :success
  end
end
