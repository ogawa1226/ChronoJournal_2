require "test_helper"

class ReflectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reflections_index_url
    assert_response :success
  end

  test "should get new" do
    get reflections_new_url
    assert_response :success
  end

  test "should get show" do
    get reflections_show_url
    assert_response :success
  end

  test "should get edit" do
    get reflections_edit_url
    assert_response :success
  end
end
