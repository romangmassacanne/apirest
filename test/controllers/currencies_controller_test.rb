require "test_helper"

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get currencies_index_url
    assert_response :success
  end

  test "should get show" do
    get currencies_show_url
    assert_response :success
  end

  test "should get create" do
    get currencies_create_url
    assert_response :success
  end

  test "should get update" do
    get currencies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get currencies_destroy_url
    assert_response :success
  end
end
